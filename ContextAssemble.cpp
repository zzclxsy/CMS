#include "ContextAssemble.h"

ContextAssemble::ContextAssemble(QObject *parent):QObject(parent)
{
     mp_logManager = new LogManager;
     mp_loginManager = new LoginManager;
     mp_pluginManager = new PluginManager;
}

void ContextAssemble::RegisterContext(QQmlApplicationEngine *engine)
{
    engine->rootContext()->setContextProperty("appdir", qApp->applicationDirPath());
    engine->rootContext()->setContextProperty("LoginManager_UsersModel",mp_loginManager->userModel());
    engine->rootContext()->setContextProperty("LoginManager",mp_loginManager);
    engine->rootContext()->setContextProperty("PluginManager_PluginDataModel",mp_pluginManager->getPluginDataModel());
    engine->rootContext()->setContextProperty("LogManager",mp_logManager);
    engine->rootContext()->setContextProperty("PluginManager",mp_pluginManager);
}

