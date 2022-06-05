#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QObject>
#include <QStandardItemModel>
#include <QQmlContext>
#include "sqlite/systemSqliteAccess.h"
class UserModel:public QStandardItemModel
{
   Q_OBJECT
public:
    UserModel(QObject *parent = nullptr):QStandardItemModel(parent){}
    ~UserModel(){}
    Q_INVOKABLE inline void deleteRow(int index){
         QString name = this->item(index,0)->text();
         delete this->takeItem(index);
         this->removeRow(index);
         SystemSqliteAccess::instance()->deleteUserByUserName(name);
    }

    Q_INVOKABLE inline int count(){
        return this->rowCount();
    }
    Q_INVOKABLE inline QString getQuestion(QString userName){
        return SystemSqliteAccess::instance()->GetUserInfo(userName).question;
    }
};

class LoginManager: public QObject
{
    Q_OBJECT
public:
    LoginManager(QObject *parent = nullptr);
    ~LoginManager();
    Q_INVOKABLE QString login(QString userName, QString password);
    Q_INVOKABLE QString registerUser(const QVariantList &userInfo);
    Q_INVOKABLE QString judgeSecurityQuestion(QString userName, QString question, QString answer);
    Q_INVOKABLE QString setNewPassword(QString userName, QString password);
    Q_INVOKABLE UserModel *userModel();

private:
    UserModel *mp_userModel;
    QString Mm;
};

#endif // LOGINCTRL_H
