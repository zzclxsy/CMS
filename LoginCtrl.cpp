#include "LoginCtrl.h"
#include "sqlite/SystemSqliteAccess.h"
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>
#include "Utility.h"
#include "ErrorCode.h"

LoginCtrl::LoginCtrl(QObject *parent):QObject(parent)
{
    SystemSqliteAccess::instance();
}

LoginCtrl::~LoginCtrl()
{

}

QString LoginCtrl::login(QString userName, QString password)
{ 
    QJsonObject root;
    QJsonObject error;
    SystemSqliteAccess *dataBase = SystemSqliteAccess::instance();

    do
    {
        if (!dataBase->isExistUserName(userName))
        {
            error["code"] = ErrorEnum::UserNameNotExist;
            error["message"] = "用户名不存在";
            break;
        }

        if (SystemSqliteAccess::instance()->GetUserPassword(userName) != password)
        {
            error["code"] = ErrorEnum::PasswordError;
            error["message"] = "密码错误";
            break;
        }

        return QString("");
    }while(0);


    root["error"] = error;
    return Utility::JsonToString(root);
}

QString LoginCtrl::registerUser(const QVariantList &userInfo)
{
    User_t user;
    user.userName = userInfo[0].toString();
    user.password =  userInfo[1].toString();
    user.question =  userInfo[2].toString();
    user.answer =  userInfo[3].toString();

    QJsonObject root;
    QJsonObject error;

    SystemSqliteAccess *dataBase = SystemSqliteAccess::instance();

    do
    {
        if (dataBase->isExistUserName(user.userName))
        {
            error["code"] = ErrorEnum::UserNameExist;
            error["message"] = "用户名存在";
            break;
        }

        if (!dataBase->InsertUserTable(user))
        {
            error["code"] = ErrorEnum::UserCreateError;
            error["message"] = "注册失败";
            break;
        }

        return QString("");
    }while(0);

    root["error"] = error;
    return Utility::JsonToString(root);
}

QString LoginCtrl::judgeSecurityQuestion(QString question, QString answer)
{
    QJsonObject root;
    QJsonObject error;

    if (SystemSqliteAccess::instance()->GetQuestionAnswer(question) == answer)
    {
        return QString("");
    }
    error["code"] = ErrorEnum::AnswerError;
    error["message"] = "答案错误";
    root["error"] = error;
    return Utility::JsonToString(root);
}

QString LoginCtrl::setNewPassword(QString userName, QString password)
{
    QJsonObject root;
    QJsonObject error;

    SystemSqliteAccess *dataBase = SystemSqliteAccess::instance();

    do
    {
        if (!dataBase->isExistUserName(userName))
        {
            error["code"] = ErrorEnum::UserNameNotExist;
            error["message"] = "用户名不存在";
            break;
        }

        User_t user = dataBase->GetUserInfo(userName);
        user.password = password;

        if (!dataBase->UpdataUserInfo(user))
        {
            error["code"] = ErrorEnum::UserInfoUpdataError;
            error["message"] = "密码更新错误";
            break;
        }

        return QString("");
    }while(0);

    root["error"] = error;
    return Utility::JsonToString(root);
}

