#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "LoginCtrl.h"
#include "ErrorCode.h"
#include <QQmlContext>

#include <QDebug>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    LoginCtrl login;
    QQmlApplicationEngine engine;

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
