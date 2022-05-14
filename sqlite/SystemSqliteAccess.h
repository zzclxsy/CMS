#ifndef SYSTEMSQLITEACCESS_H
#define SYSTEMSQLITEACCESS_H

#include "BaseSqliteAccess.h"

typedef struct{
    QString userName;
    QString password;
    QString question;
    QString answer;
} User_t;

class SystemSqliteAccess : public BaseSqliteAccess
{
public:
    SystemSqliteAccess(QString dbName);

    //user_t表
    bool    InsertUserTable(User_t user);
    bool    isExistUserName(QString userName);
    bool    UpdataUserInfo(User_t user);
    bool    deleteUserByUserName(QString userName);

    User_t  GetUserInfo(QString userName);
    QString GetUserPassword(QString userName);
    QString GetQuestionAnswer(QString userName, QString question);
    QList<QString> GetAllUserName();


    static SystemSqliteAccess *instance(QString dbName = "./system.db");

private:
    bool checkTable(QString tableName);

private:
    static SystemSqliteAccess *mp_instance;
};

#endif // SYSTEMSQLITEACCESS_H
