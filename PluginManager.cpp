#include "PluginManager.h"
#include <QFile>
#include <QGuiApplication>
#include <QJsonObject>
#include "Utility.h"
#include <QDebug>
#include <QUrl>
#include <QFileInfo>
#include <QThread>
#include <QtConcurrent>
#define CMS_VERSION "CMS1.0"
#include <QtGui/private/qzipreader_p.h>
#include <QtGui/private/qzipwriter_p.h>
QString getTag(const QString &in_file_path)
{
    QFile tmpfile(in_file_path);
    if (tmpfile.open(QIODevice::ReadOnly))
    {
        QByteArray ba= tmpfile.readLine();
        tmpfile.close();
        QByteArray tag = ba.left(10);
        return tag;
    }
    return "";
}

QString delZipTag(const QString &in_file_path, QString Ctag)
{
    QFile tmpfile(in_file_path);
    if (tmpfile.open(QIODevice::ReadOnly))
    {
        QByteArray ba= tmpfile.readAll();
        tmpfile.close();
        QByteArray tag = ba.left(10);

        QByteArray name = Ctag.toLocal8Bit();

        while (name.length() < 10)
        {
            name.append(" ");
        }

        if (tag == name)
        {
            ba.remove(0,10);
            QFile file(in_file_path);
            file.open(QIODevice :: WriteOnly | QIODevice :: Truncate);
            file.write(ba);
            file.close();
            return in_file_path;
        }
        else
        {
            return "";
        }
    }
    return "";
}


//! \brief zipReader    zip包解压缩
//! \param zipPath      压缩包路径
//! \param zipDir       解压缩目录
//! \return 是否解压成功
bool zipReader(QString zipPath, QString zipDir="")
{
    QDir tempDir;
    if(!tempDir.exists(zipDir)) tempDir.mkpath(zipDir);
    QZipReader reader(zipPath);
    return reader.extractAll(zipDir);
}


PluginManager::PluginManager(QObject *parent):QObject(parent)
{
    mp_model = new PluginDataModel;

    //读取插件列表
    QString pluginPath = qApp->applicationDirPath() + "/plugin/";
    QDir dir(pluginPath);
    QStringList filter;
    filter << "*";
    QStringList files = dir.entryList(filter, QDir::Dirs|QDir::NoDotAndDotDot, QDir::Name);
    for (QString file : files)
    {
        if (CheckFilePass(pluginPath+file))
        {
            addDataToModel(file);
        }
    }
}


bool PluginManager::CheckFilePass(QString fileName)
{
    QString moduleName;
    QString pluginName;
    QString aliasName;
    QString icon;
    QFileInfo info(fileName);
    //检查文件夹名
    QString fileDirName = info.baseName();
    QFile file(fileName + "/qmldir");
    if (!file.exists())
    {
        return false;
    }

    if (!file.open(QIODevice::ReadOnly))
    {
        return false;
    }
    QTextStream in(&file);

    while (!in.atEnd())
    {
        QString line = in.readLine();
        QString key = line.section(" ",0,0);
        if (key == "module")
        {
            moduleName = line.section(" ",1,1).replace(" ","");
        }
        else if (key == "plugin")
        {
            pluginName = line.section(" ",1,1).replace(" ","");
        }
        else if (key == "alias")
        {
            aliasName = line.section(" ",1,1).replace(" ","").toLocal8Bit();
        }
        else if (key == "icon")
        {
            icon = line.section(" ",1,1).replace(" ","").toLocal8Bit();
        }
    }
    file.close();
    if (aliasName.isEmpty())
    {
        return false;
    }
    if (fileDirName != moduleName)
    {
        return false;
    }

    if (icon.isEmpty())
    {
        return false;
    }

    //判断文件是否存在
    if (QFile::exists(fileName + "/" + icon) == false)
    {
        return false;
    }

    if (QFile::exists(fileName + "/" + "main.qml") == false)
    {
        return false;
    }

    if (QFile::exists(fileName + "/" + pluginName + ".dll") == false)
    {
        return false;
    }

    return true;
}
QString PluginManager::installCMS(QString path)
{
    path = path.remove(0,8);//去掉file:///

    QEventLoop loop;
    connect(this, &PluginManager::finished, &loop, &QEventLoop::quit);
    QtConcurrent::run(this,&PluginManager::install,path);

    loop.exec();

    //添加数据，数据只能在主线程中添加
    QFileInfo info (path);
    QString zipFileName = info.baseName();

    addDataToModel(zipFileName.section("__",1,1));
    return m_errorStr;
}

void PluginManager::install(QString oldPath)
{
    QJsonObject root;
    QJsonObject error;

    QFileInfo info (oldPath);
    QString newPath = qApp->applicationDirPath() + "/temp/" + info.baseName() + ".zip";

    do
    {
        if (QFile::copy(oldPath, newPath) == false)
        {
            error["message"] = "临时文件创建失败";
            break;
        }
        //判断是否是CMS安装包
        QString tag = getTag(newPath).replace(" ","");
        if (tag != CMS_VERSION)
        {
            error["message"] = "版本不符合，无法安装";
            break;
        }
        //去掉前缀
        newPath = delZipTag(newPath, CMS_VERSION);
        zipReader(newPath,"./plugin/");

        QFile::remove(newPath);
        emit finished();
        return;
    }while(0);

    root["error"] = error;
    m_errorStr = Utility::JsonToString(root);

    QFile::remove(oldPath);
    QFile::remove(newPath);
    emit finished();
}

PluginDataModel *PluginManager::getPluginDataModel()
{
    return mp_model;
}

void PluginManager::addDataToModel(QString moduleName)
{
    QString pluginPath = qApp->applicationDirPath() + "/plugin/" +moduleName;
    QFile file(pluginPath + "/" + "qmldir");
    if (file.open(QIODevice::ReadOnly) == false)
        return;

    QString pluginName;
    QString aliasName;
    QString icon;

    QTextStream in(&file);
    while (!in.atEnd())
    {
        QString line = in.readLine();
        QString key = line.section(" ",0,0);

        if (key == "plugin")
        {
            pluginName = line.section(" ",1,1).replace(" ","");
        }
        else if (key == "alias")
        {
            aliasName = line.section(" ",1,1).replace(" ","").toLocal8Bit();
        }
        else if (key == "icon")
        {
            icon = line.section(" ",1,1).replace(" ","").toLocal8Bit();
        }
    }
    file.close();

    qDebug()<<pluginName<<aliasName<<moduleName<<icon;

    PluginItem *item = new PluginItem;
    item->SetPluginAliasName(aliasName);
    item->setPluginModuleName(moduleName);
    item->SetUrlIcon(icon);
    mp_model->addRow(item);
}


