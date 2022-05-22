#include "logData.h"
#include <QStandardItem>
#include <QDebug>
#include <QTimer>
#include "XCoreApplication.h"
#include <thread>
LogModel::LogModel(QObject *parent):QAbstractListModel(parent)
{
    m_roles.insert(Role::Type,"type");
    m_roles.insert(Role::Message,"message");

    LogItem *item = new LogItem;
    item->setType("allLog");
    item->setMessage("this is wwww4777");
    m_items.append(item);
}

int LogModel::rowCount(const QModelIndex &) const
{
    return m_items.count();
}

QVariant LogModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (role == Role::Type)
        return QVariant(m_items[index.row()]->Type());

    if (role == Role::Message)
            return QVariant(m_items[index.row()]->Message());

    return QVariant();
}

QHash<int, QByteArray> LogModel::roleNames() const
{
    return m_roles;
}

QQmlListProperty<LogItem> LogModel::datas()
{
    return QQmlListProperty<LogItem>(this, &m_items, &LogModel::AppendFunction, nullptr, nullptr, nullptr);
}

void LogModel::AppendFunction(QQmlListProperty<LogItem> *property, LogItem *value)
{
    auto items = static_cast<QList<LogItem *> *>(property->data);
    items->append(value);
}


QString LogItem::Type() const
{
    return m_type;
}

QString LogItem::Message() const
{
    return m_message;
}

void LogItem::setType(QString type)
{
    if (m_type == type)
        return;

    m_type = type;
    emit TypeChanged(m_type);
}

void LogItem::setMessage(QString message)
{
    if (m_message == message)
        return;

    m_message = message;
    emit MessageChanged(m_message);
}

int LogData::hander(VXSocketSession *, const char *data, int leng)
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
LogData::LogData(QObject *parent):QObject(parent)
{
    mp_server = XCoreApplication::GetApp()->CreateTcpServer();
    mp_server->SetIpAddress("127.0.0.1");
    mp_server->SetPort(8080);
    mp_server->SetDataHandler(std::bind(&LogData::hander,this,std::placeholders::_1,std::placeholders::_2,std::placeholders::_3));
    mp_server->Start();
}
