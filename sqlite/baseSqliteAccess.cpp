#include "baseSqliteAccess.h"
#include <QSqlError>
#include <QSqlRecord>
#include <QFile>
#include <QFileInfo>
#include <QTextStream>
#include <QDebug>
#include <QDir>

baseSqliteAccess::baseSqliteAccess(QString databaseName)
{
    m_filename = databaseName;

    /* 检查连接、添加数据库驱动、设置数据库名称、数据库登录用户名、密码 */
    QFileInfo databaseInfo(m_filename);
    QDir rootDir("./");
    rootDir.mkpath(databaseInfo.absolutePath());

    m_connection = databaseInfo.completeBaseName();
    QStringList connectList = QSqlDatabase::connectionNames();
    if (connectList.contains(m_connection))
        m_database = QSqlDatabase::database(m_connection);
    else
    {
        m_database = QSqlDatabase::addDatabase("QSQLITE", m_connection);
        m_database.setUserName("admin");
        m_database.setPassword("admin");
        m_database.setDatabaseName(m_filename);

        /* 打开数据库 */
        m_database.open();
    }

    /* 创建表格 */
    m_sqlQuery = QSqlQuery(m_database);

    QFile db(m_filename);
    db.open(QIODevice::ReadWrite);
    db.close();
}

baseSqliteAccess::~baseSqliteAccess()
{
    m_mutex.lock();
    m_sqlQuery.finish();
    m_database.close();
    m_mutex.unlock();
}

bool baseSqliteAccess::checkDatabaseVaild(QString pathName)
{
    //判断文件是否存在
    QDir dir;
    if (dir.exists(pathName) == false)
        return false;

    //判断文件是否能打开
    /* 检查连接、添加数据库驱动、设置数据库名称、数据库登录用户名、密码 */
    QFileInfo databaseInfo(pathName);

    QString connection = databaseInfo.completeBaseName();
    QStringList connectList = QSqlDatabase::connectionNames();
    QSqlDatabase database;
    if (!connectList.contains(connection))
    {
        database = QSqlDatabase::addDatabase("QSQLITE", connection);
        database.setUserName("admin");
        database.setPassword("admin");
        database.setDatabaseName(pathName);

        /* 打开数据库 */
        if (!database.open())
            return false;

        QSqlQuery sqlQuery = QSqlQuery(database);
        bool isValid = sqlQuery.prepare("PRAGMA quick_check;");
        database.close();
        return isValid;
    }
    return true;
}

void baseSqliteAccess::setFactory()
{
    m_mutex.lock();
    m_sqlQuery.finish();
    m_database.close();

    QFile::setPermissions(m_filename, QFile::WriteOwner);
    QFile::remove(m_filename);
    m_mutex.unlock();
}

QString baseSqliteAccess::connection() const
{
    return m_connection;
}

bool baseSqliteAccess::read(QString cmdStr, QList<QStringList> &result)
{
    bool iRet = false;

    m_mutex.lock();

    do
    {
        if (cmdStr.isEmpty())
            break;

        if (!m_sqlQuery.exec(cmdStr))
        {
            qDebug() << m_sqlQuery.lastError();
            qDebug() << cmdStr;
            break;
        }

        while (m_sqlQuery.next())
        {
            QSqlRecord record = m_sqlQuery.record();
            QStringList dataList;
            for (int i = 0; i < record.count(); i++)
            {
                dataList << record.value(i).toString();
            }

            result << dataList;
        }

        iRet = true;
    }while (0);

    m_mutex.unlock();

    return iRet;
}

bool baseSqliteAccess::write(QString cmdStr)
{
    bool iRet = false;

    m_mutex.lock();

    do
    {
        if (cmdStr.isEmpty())
            break;

        if (!m_sqlQuery.exec(cmdStr))
        {
            qDebug() << m_sqlQuery.lastError();
            break;
        }

        iRet = true;
    }while (0);

    m_mutex.unlock();

    return iRet;
}

bool baseSqliteAccess::transaction()
{
    if (m_database.isOpen())
        return m_database.transaction();

    return false;
}

bool baseSqliteAccess::commit()
{
    if (m_database.isOpen())
        return m_database.commit();

    return false;
}

QString baseSqliteAccess::baseName() const
{
    return m_database.databaseName();
}
