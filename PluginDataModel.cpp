#include "PluginDataModel.h"

QString PluginItem::GetPluginAliasName() const
{
    return m_pluginAliasName;
}

QString PluginItem::GetPluginModuleName() const
{
    return m_pluginModuleName;
}

QString PluginItem::GetUrlIcon() const
{
    return m_urlIcon;
}

void PluginItem::SetPluginAliasName(QString alias)
{
    if (m_pluginAliasName == alias)
        return;

    m_pluginAliasName = alias;
    emit pluginAliasNameChanged(m_pluginAliasName);
}

void PluginItem::setPluginModuleName(QString moduleName)
{
    if (m_pluginModuleName == moduleName)
        return;

    m_pluginModuleName = moduleName;
    emit pluginModuleNameChanged(m_pluginModuleName);
}

void PluginItem::SetUrlIcon(QString urlIcon)
{
    if (m_urlIcon == urlIcon)
        return;

    m_urlIcon = urlIcon;
    emit urlIconChanged(m_urlIcon);
}


PluginDataModel::PluginDataModel(QObject *parent):QAbstractListModel(parent)
{
    m_roles.insert(Role::AliasName,"aliasName");
    m_roles.insert(Role::ModuleName,"moduleName");
    m_roles.insert(Role::UrlIcon,"urlIcon");
}

void PluginDataModel::addRow(PluginItem *item)
{
    beginInsertRows(QModelIndex(),rowCount(),rowCount());
    m_items.append(item);
    endInsertRows();
}

int PluginDataModel::rowCount(const QModelIndex &) const
{
    return m_items.count();
}

QVariant PluginDataModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid())
        return QVariant();

    if (role == Role::AliasName)
        return QVariant(m_items[index.row()]->GetPluginAliasName());

    if (role == Role::ModuleName)
        return QVariant(m_items[index.row()]->GetPluginModuleName());

    if (role == Role::UrlIcon)
        return QVariant(m_items[index.row()]->GetUrlIcon());

    return QVariant();
}

QHash<int, QByteArray> PluginDataModel::roleNames() const
{
    return m_roles;
}

QQmlListProperty<PluginItem> PluginDataModel::datas()
{
    return QQmlListProperty<PluginItem>(this, &m_items, &PluginDataModel::AppendFunction, nullptr, nullptr, nullptr);
}

void PluginDataModel::AppendFunction(QQmlListProperty<PluginItem> *property, PluginItem *value)
{
    auto items = static_cast<QList<PluginItem *> *>(property->data);
    items->append(value);
}
