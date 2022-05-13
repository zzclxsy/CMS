#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QObject>

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

};

#endif // LOGINCTRL_H
