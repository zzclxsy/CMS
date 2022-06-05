#ifndef PLUGINMANANGER_H
#define PLUGINMANANGER_H
#include <QObject>
#include <QAbstractListModel>
#include <QQmlListProperty>
class PluginItem: public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString pluginAliasName READ GetPluginAliasName WRITE SetPluginAliasName NOTIFY pluginAliasNameChanged)
    Q_PROPERTY(QString pluginModuleNam READ GetPluginModuleName WRITE setPluginModuleName NOTIFY pluginModuleNameChanged)
    Q_PROPERTY(QString urlIcon READ GetUrlIcon WRITE SetUrlIcon NOTIFY urlIconChanged)
    QString GetPluginAliasName() const;
    QString GetPluginModuleName() const;

    QString GetUrlIcon() const;

public slots:
    void SetPluginAliasName(QString type);
    void setPluginModuleName(QString message);
    void SetUrlIcon(QString urlIcon);

signals:
    void pluginAliasNameChanged(QString type);
    void pluginModuleNameChanged(QString message);
    void urlIconChanged(QString urlIcon);

private:
    QString m_pluginAliasName;
    QString m_pluginModuleName;
    QString m_urlIcon;
};


class PluginDataModel:public QAbstractListModel
{
    Q_OBJECT
public:
    enum Role{
        AliasName = (Qt::DisplayRole + 1),
        ModuleName,
        UrlIcon
    };

    Q_ENUM(Role)
    Q_PROPERTY(QQmlListProperty<PluginItem> datas READ datas);

    PluginDataModel(QObject *parent = nullptr);
    ~PluginDataModel(){}


    void addRow(PluginItem *item);
    virtual int rowCount(const QModelIndex &parent = QModelIndex()) const;
    virtual QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    virtual QHash<int, QByteArray> roleNames() const;

    QQmlListProperty<PluginItem> datas();

    static void AppendFunction(QQmlListProperty<PluginItem> *property, PluginItem *value);

private:
    QHash<int, QByteArray> m_roles;
    QList<PluginItem *>m_items;
};

#endif // PLUGINMANANGER_H
