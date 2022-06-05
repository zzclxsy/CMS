QT += quick sql concurrent gui-private

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0
TARGET = CMS

HEADERS += \
    ContextAssemble.h \
    ErrorCode.h \
    LogManager.h \
    LoginManager.h \
    PluginDataModel.h \
    PluginManager.h \
    Utility.h \
    sqlite/baseSqliteAccess.h \
    sqlite/systemSqliteAccess.h


SOURCES += \
	ContextAssemble.cpp \
	LogManager.cpp \
	LoginManager.cpp \
	PluginDataModel.cpp \
	PluginManager.cpp \
	Utility.cpp \
	main.cpp \
	sqlite/baseSqliteAccess.cpp \
        sqlite/systemSqliteAccess.cpp

CONFIG(debug, debug|release) {

    LIBS += -LE:\\lib\\x64\\debug\\boost -llibboost_filesystem-vc141-mt-gd-x64-1_79
    LIBS += -LE:\\lib\\x64\\debug\\mqtt -lpaho-mqtt3c
    LIBS += -LE:\\lib\\x64\\debug\\mqtt -lpaho-mqtt3a
    LIBS += -LE:\\lib\\x64\\debug\\XFramework -llibFrameworkd

    DESTDIR = $$PWD/bin/debug
} else {
    LIBS += -LE:\\lib\\x64\\release\\boost -llibboost_filesystem-vc141-mt-x64-1_79
    LIBS += -LE:\\lib\\x64\\release\\mqtt -lpaho-mqtt3c
    LIBS += -LE:\\lib\\x64\\release\\mqtt -lpaho-mqtt3a
    LIBS += -LE:\\lib\\x64\\release\\XFramework -llibFramework

    DESTDIR = $$PWD/bin/release
}
INCLUDEPATH += E:\\include
INCLUDEPATH += E:\\include\\XFramework

RESOURCES += qml.qrc \
    Resource.qrc

msvc {
    QMAKE_CFLAGS += /utf-8
    QMAKE_CXXFLAGS += /utf-8
}

# Additional import path used to resolve QML modules in Qt Creator's code model
#QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
#QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

RC_ICONS = CMS.ico
