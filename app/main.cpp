#include <QApplication>

#include "fontend/mainwindow.h"

#include "backend/backendfactory.h"
#include "backend/winbackend.h"

#include "config/log.h"
#include "config/config.h"

#include <xsys.h>


#include <QApplication>
#include <QStandardPaths>
#include <QProcess>
#include <Windows.h>

using namespace DeepinInstaller;

void GenerateFontImage();

int main(int argc, char**argv) {
    Q_INIT_RESOURCE(xsys);
    Q_INIT_RESOURCE(dwidget);
    QApplication app(argc, argv);
    InstallLogHandler();
    LoadFonts();
    LoadTranslate(app);

    MainWindow w;
    w.setWindowTitle (QObject::tr("Deepin System Installer"));
    w.setWindowIcon(QIcon(":/data/deepin-system-installer.png"));
    w.show();

    int ret = app.exec();
    qDebug()<<"app.exec() return with"<<ret;
    return 0;
}