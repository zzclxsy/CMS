#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ContextAssemble.h"
#include <QQmlContext>
#include <QDebug>
#include "XCoreApplication.h"
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    XCoreApplication XApp(argc,argv);

    //创建插件文件夹
    QString pluginfile = qApp->applicationDirPath() + "/plugin";
    QDir dir(pluginfile);
    if(!dir.exists())
        dir.mkdir(pluginfile);

    //创建临时文件夹
    pluginfile = qApp->applicationDirPath() + "/temp";
    QDir dir2(pluginfile);
    if(!dir2.exists())
        dir2.mkdir(pluginfile);

    ContextAssemble CAssemble;
    QQmlApplicationEngine engine;
    engine.addImportPath("./plugin/");
    CAssemble.RegisterContext(&engine);

    const QUrl url(QStringLiteral("qrc:/qml/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
