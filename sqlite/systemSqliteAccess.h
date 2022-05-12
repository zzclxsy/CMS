#ifndef SYSTEMSQLITEACCESS_H
#define SYSTEMSQLITEACCESS_H

#include "baseSqliteAccess.h"

typedef struct{
    QString userName;
    QString password;
} User_t;

class SystemSqliteAccess : public baseSqliteAccess
{
public:
    SystemSqliteAccess(QString dbName);

    //user_t表
    bool InsertUserTable(User_t user);
    QString GetUserPassword(QString userName);

    static SystemSqliteAccess *instance(QString dbName = "./system.db");

private:
    bool checkTable(QString tableName);

private:
    static SystemSqliteAccess *mp_instance;
};

#endif // SYSTEMSQLITEACCESS_H
