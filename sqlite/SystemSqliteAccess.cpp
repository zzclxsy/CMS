#include "SystemSqliteAccess.h"
#include <QDebug>
SystemSqliteAccess *SystemSqliteAccess::mp_instance = nullptr;
SystemSqliteAccess::SystemSqliteAccess(QString dbName):BaseSqliteAccess(dbName)
{
    QStringList execStrs;
    execStrs << QString ("PRAGMA recursive_triggers = ON;");
    /* 检查群组表是否存在 */
    if (!checkTable(QString("user_tb")))
    {
        execStrs << QString("create table user_tb(		\
                                id integer primary key,		\
                            userName varchar(128) default '',\
                            userPassword varchar(128) default '',\
                            userQuestion varchar(128) default '',\
                            userAnswer varchar(128) default ''\
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
    QString exec = QString ("insert into user_tb values(NULL,'%1', '%2','%3', '%4');")
            .arg(user.userName).arg(user.password).arg(user.question).arg(user.answer);

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

QString SystemSqliteAccess::GetQuestionAnswer(QString userName, QString question)
{
    QString exec = QString ("select userAnswer from user_tb where userQuestion = '%1' and userName = '%2';")
            .arg(question).arg(userName);

    QList<QStringList> retList;

    if (read(exec, retList) == false || retList.count() == 0)
            return QString("");

    return retList.at(0).at(0);
}

QList<QString> SystemSqliteAccess::GetAllUserName()
{
    QString exec = QString ("select userName from user_tb;");

    QList<QString> userList;
    QList<QStringList> retList;

    if (read(exec, retList) == false || retList.count() == 0)
            return userList;

    for(QStringList list: retList)
    {
        userList.append(list.first());
    }
    return userList;
}

bool SystemSqliteAccess::isExistUserName(QString userName)
{
    QString exec = QString ("select * from user_tb where userName = '%1' limit 1;")
            .arg(userName);

    QList<QStringList> retList;

    if (read(exec, retList) == false || retList.count() == 0)
            return false;

    return true;
}

bool SystemSqliteAccess::UpdataUserInfo(User_t user)
{
    QString exec = QString ("update user_tb set userPassword='%1',userQuestion='%2',userAnswer='%3' where userName = '%4';")
            .arg(user.password).arg(user.question).arg(user.answer).arg(user.userName);

    return write(exec);
}

bool SystemSqliteAccess::deleteUserByUserName(QString userName)
{
    QString execStr = QString("delete from user_tb where userName='%1';")
                .arg(userName);

    return write(execStr);
}

User_t SystemSqliteAccess::GetUserInfo(QString userName)
{
    QString exec = QString ("select * from user_tb where userName = '%1';")
            .arg(userName);

    User_t user;

    QList<QStringList> retList;

    if (read(exec, retList) == false || retList.count() == 0)
            return user;

    user.userName = retList.at(0).at(1);
    user.password = retList.at(0).at(2);
    user.question = retList.at(0).at(3);
    user.answer = retList.at(0).at(4);
    return user;
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
