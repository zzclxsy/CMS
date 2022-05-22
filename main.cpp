#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "loginCtrl.h"
#include "errorCode.h"
#include "logData.h"
#include <QQmlContext>
#include <QDebug>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    LogData logdata;
    LoginCtrl login;
    QQmlApplicationEngine engine;


   // qmlRegisterType<LogModel>("LogModel",1,0,"LogModel");
   // qmlRegisterType<LogItem>("LogItem",1,0,"LogItem");


    engine.rootContext()->setContextProperty("LogData",&logdata);

    engine.rootContext()->setContextProperty("UsersModel",login.userModel());
    engine.rootContext()->setContextProperty("Logindata",(QObject *)&login);
    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
