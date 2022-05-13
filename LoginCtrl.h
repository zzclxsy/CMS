#ifndef LOGINCTRL_H
#define LOGINCTRL_H
#include <QObject>

class loginCtrl: public QObject
{
    Q_OBJECT
public:
    loginCtrl(QObject *parent = nullptr);
    Q_INVOKABLE bool IsCanLogin(QString userName, QString password);

    ~loginCtrl();
};

#endif // LOGINCTRL_H
