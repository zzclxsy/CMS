#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QObject>

class LoginCtrl: public QObject
{
    Q_OBJECT
public:
    LoginCtrl(QObject *parent = nullptr);
    ~LoginCtrl();

    Q_INVOKABLE QString Login(QString userName, QString password);
    Q_INVOKABLE QString Register(const QVariantList &userInfo);
    Q_INVOKABLE QString JudgeSecurityQuestion(QString question, QString answer);
    Q_INVOKABLE QString SetNewPassword(QString userName, QString password);

};

#endif // LOGINCTRL_H
