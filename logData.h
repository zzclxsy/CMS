#ifndef LOGDATA_H
#define LOGDATA_H
#include <QAbstractListModel>
#include <QtQuick>
#include "VXTcpServer.h"
class LogItem: public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString type READ Type WRITE setType NOTIFY TypeChanged)
    Q_PROPERTY(QString message READ Message WRITE setMessage NOTIFY MessageChanged)

    QString Type() const;
    QString Message() const;

public slots:
    void setType(QString type);
    void setMessage(QString message);

signals:
    void TypeChanged(QString type);
    void MessageChanged(QString message);

private:
    QString m_type;
    QString m_message;
};




class LogModel:public QAbstractListModel
{
    Q_OBJECT
    enum Role{
        Type = (Qt::DisplayRole + 1),
        Message
    };

     Q_PROPERTY(QQmlListProperty<LogItem> datas READ datas);
public:
    LogModel(QObject *parent = nullptr);
    ~LogModel(){}



    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    virtual QHash<int, QByteArray> roleNames() const;

    QQmlListProperty<LogItem> datas();

    static void AppendFunction(QQmlListProperty<LogItem> *property, LogItem *value);

private:
    QHash<int, QByteArray> m_roles;
    QList<LogItem *>m_items;
};

class LogData:public QObject
{
    Q_OBJECT
public:
    LogData(QObject *parent = nullptr);

private:
     int hander(VXSocketSession *, const char *data, int leng);
private:
    std::shared_ptr<VXTcpServer> mp_server;

signals:
    void setLogMessage(QString type, QString message);
};

#endif // LOGDATA_H
