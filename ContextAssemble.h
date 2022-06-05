#ifndef CONTEXTASSEMBLE_H
#define CONTEXTASSEMBLE_H
#include "LogManager.h"
#include "LoginManager.h"
#include "PluginManager.h"
#include <QObject>
class ContextAssemble:public QObject
{
    Q_OBJECT
public:
    ContextAssemble(QObject *parent = nullptr);
    ~ContextAssemble(){}

    void RegisterContext(QQmlApplicationEngine *engine);

private:
    LogManager *mp_logManager;
    LoginManager *mp_loginManager;
    PluginManager *mp_pluginManager;
};

#endif // CONTEXTASSEMBLE_H
