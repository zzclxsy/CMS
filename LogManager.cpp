#include "LogManager.h"
#include <QStandardItem>
#include <QDebug>
#include <QTimer>
#include "XCoreApplication.h"
#include <thread>
#include <XLogPrint.h>
int LogManager::dataHandle(VXSocketSession *, const char *data, int leng)
{
    char buf[1024];
    memset(buf, 0, sizeof (buf));
    memcpy(buf, data, leng);
    QString str(buf);
    str.section("$",0,0);
    QString head = str.section("$",0,0);
    QString mess = str.section("$",1,1);

    emit setLogMessage(head, mess);
    return 0;
}

void LogManager::heartHandle(std::string , bool result)
{
    if (!mb_mainUI)
        return;

    if (result != mb_link)
    {
        mb_link = result;
        emit tcpLinkChange(result);
    }
}


LogManager::LogManager(QObject *parent):QObject(parent)
{
    mb_link = false;
    mb_mainUI = false;
    mp_server = XCoreApplication::GetApp()->CreateTcpServer();
    mp_server->SetDataHandler(std::bind(&LogManager::dataHandle,this,std::placeholders::_1,std::placeholders::_2,std::placeholders::_3));
    mp_server->SetHeartHander(std::bind(&LogManager::heartHandle,this,std::placeholders::_1,std::placeholders::_2));

    mp_server->SetIpAddress("127.0.0.1");
    mp_server->SetPort(8080);

    mp_server->Start();
}

void LogManager::hasInitmainUI(QString uiName)
{
    if (uiName.contains("OperationUI"))
    {
        XDEBUG <<"mb_mainUI succeed";
        mb_mainUI = true;
    }
}
