QT += quick sql

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
TARGET = CMS

CONFIG(debug, debug|release){
    DESTDIR = $$PWD/../bin/debug
} else {
    DESTDIR = $$PWD/../bin/release
}
HEADERS += \
    ErrorCode.h \
    LoginCtrl.h \
    Utility.h \
    sqlite/BaseSqliteAccess.h \
    sqlite/SystemSqliteAccess.h


SOURCES += \
	LoginCtrl.cpp \
	Utility.cpp \
	main.cpp \
	sqlite/BaseSqliteAccess.cpp \
	sqlite/SystemSqliteAccess.cpp

RESOURCES += qml.qrc \
    Resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

