#ifndef PLUGINMANAGER_H
#define PLUGINMANAGER_H
#include "PluginDataModel.h"
#include <QObject>
class PluginManager:public QObject
{
    Q_OBJECT
public:
    PluginManager(QObject *parent = nullptr);
    ~PluginManager(){}

    Q_INVOKABLE QString installCMS(QString path);

    void install(QString path);

    PluginDataModel *getPluginDataModel();

    void addDataToModel(QString path);

private:
    bool CheckFilePass(QString fileName);
private:
    PluginDataModel *mp_model;
    QString m_errorStr;
signals:
    void finished();
};

#endif // PLUGINMANAGER_H
