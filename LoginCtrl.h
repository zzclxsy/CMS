#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QObject>
#include <QStandardItemModel>
#include <QQmlContext>

class UserModel:public QStandardItemModel
{
   Q_OBJECT
public:
    UserModel(QObject *parent = nullptr):QStandardItemModel(parent){}
    ~UserModel(){}
    Q_INVOKABLE inline void deleteRow(int index){
         delete this->takeItem(index);
         this->removeRow(index);
    }

    Q_INVOKABLE inline int count(){
        return this->rowCount();
    }

};

class LoginCtrl: public QObject
{
    Q_OBJECT
public:
    LoginCtrl(QObject *parent = nullptr);
    ~LoginCtrl();
    Q_INVOKABLE QString login(QString userName, QString password);
    Q_INVOKABLE QString registerUser(const QVariantList &userInfo);
    Q_INVOKABLE QString judgeSecurityQuestion(QString question, QString answer);
    Q_INVOKABLE QString setNewPassword(QString userName, QString password);

    UserModel *userModel();
private:
    UserModel *mp_userModel;
    QString Mm;
};

#endif // LOGINCTRL_H
