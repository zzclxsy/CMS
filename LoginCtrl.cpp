#include "LoginCtrl.h"
#include "sqlite/SystemSqliteAccess.h"
#include <QDebug>
loginCtrl::loginCtrl(QObject *parent):QObject(parent)
{
    SystemSqliteAccess::instance();
}

bool loginCtrl::IsCanLogin(QString userName, QString password)
{ 
    if (SystemSqliteAccess::instance()->GetUserPassword(userName) == password)
    {
        return true;
    }

    return false;
}

loginCtrl::~loginCtrl()
{

}
