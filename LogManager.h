#ifndef LOGDATA_H
#define LOGDATA_H
#include <QAbstractListModel>
#include <QtQuick>
#include "VXTcpServer.h"

class LogManager:public QObject
{
    Q_OBJECT
public:
    LogManager(QObject *parent = nullptr);
    ~LogManager(){}

    Q_INVOKABLE void hasInitmainUI(QString uiName);
private:
     int dataHandle(VXSocketSession *, const char *data, int leng);
     void heartHandle(std::string type, bool result);

private:
    std::shared_ptr<VXTcpServer> mp_server;
    bool mb_link;
    bool mb_mainUI;
signals:
    void setLogMessage(QString type, QString message);
    void tcpLinkChange(bool isLink);
};

#endif // LOGDATA_H
