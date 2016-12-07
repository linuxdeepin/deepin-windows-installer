#-------------------------------------------------
#
#
#-------------------------------------------------

DEFINES += QT_MESSAGELOGCONTEXT

QT       += core gui network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = deepin-system-installer
TEMPLATE = app

win32-msvc* {
system(..\tools\build-version.bat $$PWD/data/build_env.h)
system(..\tools\importPo.bat app.pro)

SOURCES += \
    backend/winbackend.cpp

HEADERS += \
    backend/winbackend.h


#win32 {
#    VLD_PATH = "D:/Develop/Visual Leak Detector"
#    INCLUDEPATH += $$VLD_PATH/include
#    LIBS += -L$$VLD_PATH/lib/Win32 -lvld
#}

QMAKE_LFLAGS += /MANIFESTUAC:\"level=\'requireAdministrator\' uiAccess=\'false\'\"

RC_FILE += data\deepin-system-installer.rc
}


SOURCES += \
    backend/backend.cpp \
    main.cpp \
    fontend/mainwindow.cpp \
    config/config.cpp \
    backend/backendfactory.cpp \
    config/log.cpp \
    fontend/widgets/dheaderwidget.cpp \
    fontend/widgets/dfooterwidget.cpp \
    backend/utils.cpp \
    backend/migration.cpp

HEADERS += \
    backend/backend.h \
    fontend/mainwindow.h \
    backend/backendfactory.h \
    fontend/widgets/dheaderwidget.h \
    fontend/widgets/dfooterwidget.h \
    backend/utils.h \
    config/log.h \
    config/config.h \
    backend/progressreporter.h \
    backend/migration.h \
    data/version.h \
    data/build_env.h

RESOURCES += \
    bootloader.qrc \
    blobs.qrc \
    ui.qrc \
    data.qrc

TRANSLATIONS += deepin-system-installer.ts \
    po/en_US.ts \
    po/zh_CN.ts \
    po/zh_TW.ts \
    po/fr.ts \
    po/ru.ts \
    po/it.ts \
    po/es.ts \
    po/pt_BR.ts \
    po/tr.ts \
    po/cs.ts \

#-------------------------------------------------
# libxsys
#-------------------------------------------------
win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../lib/xsys/ -lxsys
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../lib/xsys/ -lxsysd
else:unix: LIBS += -L$$OUT_PWD/../lib/xsys/ -lxsysd
INCLUDEPATH += $$PWD/../lib/xsys
DEPENDPATH += $$PWD/../lib/xsys

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/xsys/libxsys.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/xsys/libxsysd.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/xsys/xsys.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/xsys/xsysd.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../lib/xsys/libxsys.a


win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../lib/dwidget/ -ldeepin-widget
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../lib/dwidget/ -ldeepin-widgetd
else:unix: LIBS += -L$$OUT_PWD/../lib/dwidget/ -ldeepin-widget

INCLUDEPATH += $$PWD/../lib/dwidget/include/
DEPENDPATH += $$PWD/../lib/dwidget

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/dwidget/libdeepin-widget.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/dwidget/libdeepin-widgetd.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/dwidget/deepin-widget.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/dwidget/deepin-widgetd.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../lib/dwidget/libdeepin-widget.a

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../lib/libuefi/ -llibuefi
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../lib/libuefi/ -llibuefid
else:unix: LIBS += -L$$OUT_PWD/../lib/libuefi/ -llibuefi

INCLUDEPATH += $$PWD/../lib/libuefi/include
DEPENDPATH += $$PWD/../lib/libuefi

win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/libuefi/liblibuefi.a
else:win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/libuefi/liblibuefid.a
else:win32:!win32-g++:CONFIG(release, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/libuefi/libuefi.lib
else:win32:!win32-g++:CONFIG(debug, debug|release): PRE_TARGETDEPS += $$OUT_PWD/../lib/libuefi/libuefid.lib
else:unix: PRE_TARGETDEPS += $$OUT_PWD/../lib/libuefi/libuefi.a