#include "loginCtrl.h"
#include "sqlite/systemSqliteAccess.h"
#include <QDebug>
loginCtrl::loginCtrl(QObject *parent):QObject(parent)
{
    SystemSqliteAccess::instance();
}

bool loginCtrl::IsCanLogin(QString userName, QString password)
{
    if (SystemSqliteAccess::instance()->GetUserPassword(userName) == "")
    {
        qDebug()<<"无该用户";
        return false;
    }
    return true;
}

loginCtrl::~loginCtrl()
{

}
