#ifndef BASE_SQLITE_ACCESS_H
#define BASE_SQLITE_ACCESS_H

#include <QSqlDatabase>
#include <QSqlQuery>
#include <QMutex>
#include <QString>
#include <QObject>

class BaseSqliteAccess
{
public:
    BaseSqliteAccess(QString databaseName);
    ~BaseSqliteAccess();

	static bool checkDatabaseVaild(QString pathName);
    void setFactory();
    bool read(QString cmdStr, QList<QStringList> &result);
    bool write(QString cmdStr);
    bool transaction();
    bool commit();

    QString baseName() const;
    QString connection() const;

private:
    QString m_connection;
    QSqlDatabase m_database;
    QSqlQuery m_sqlQuery;
    QString m_filename;
    QMutex m_mutex;
};

#endif // BASE_SQLITE_ACCESS_H
