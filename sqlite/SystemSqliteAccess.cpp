#include "systemSqliteAccess.h"
#include <QDebug>
SystemSqliteAccess *SystemSqliteAccess::mp_instance = nullptr;
SystemSqliteAccess::SystemSqliteAccess(QString dbName):baseSqliteAccess(dbName)
{
    QStringList execStrs;
    execStrs << QString ("PRAGMA recursive_triggers = ON;");
    /* 检查群组表是否存在 */
    if (!checkTable(QString("user_tb")))
    {
        execStrs << QString("create table user_tb(		\
                                id integer primary key,		\
                            userName varchar(128) default '',\
                            userPassword varchar(128) default ''\
                            );");
    }


    //=====================================创建触发器==========================================


    //========================================================================================
    if (execStrs.count() <= 0)
        return;

    transaction();

    for (QString execStr: execStrs)
    {
        qDebug()<<execStr;
        write(execStr);
    }

    commit();
}
//user_tb
bool SystemSqliteAccess::InsertUserTable(User_t user)
{
    QString exec = QString ("insert into user_tb values('%1', '%2');")
            .arg(user.userName).arg(user.password);

    return write(exec);
}

QString SystemSqliteAccess::GetUserPassword(QString userName)
{
    QString exec = QString ("select userPassword from user_tb where userName = '%1';")
            .arg(userName);

    QList<QStringList> retList;

    if (read(exec, retList) == false || retList.count() == 0)
            return QString("");

    return retList.at(0).at(0);
}

SystemSqliteAccess *SystemSqliteAccess::instance(QString dbName)
{
    if (mp_instance != nullptr)
        return mp_instance;

    mp_instance = new SystemSqliteAccess(dbName);
    return mp_instance;
}

bool SystemSqliteAccess::checkTable(QString tableName)
{
    QList<QStringList> retList;
    /* 检查表是否存在 */
    QString checkStr = QString("select * from %1;").arg(tableName);
    qint32 ret = read(checkStr, retList);
    if (!ret)
        return false;
    else
        return true;
}
