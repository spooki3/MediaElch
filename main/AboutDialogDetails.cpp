#include "AboutDialogDetails.h"
#include "ui_AboutDialogDetails.h"

#include "Version.h"
#include "globals/Globals.h"
#include "settings/Settings.h"

#include <QCoreApplication>
#include <QStandardPaths>
#include <QString>
#include <QSysInfo>

AboutDialogDetails::AboutDialogDetails(QWidget *parent) : QDialog(parent)
{
    ui.setupUi(this);

    QString infos;
    QTextStream infoStream(&infos);
    infoStream << MediaElch::Constants::AppName << " " << MediaElch::Constants::AppVersionStr << " - "
               << "Talax"
               << "<br><br>"
               << QStringLiteral("Compiled with Qt version %1 (%2 %3, %4)<br>")
                      .arg(QT_VERSION_STR,
                          QString::number(QSysInfo::WordSize),
                          MediaElch::Constants::CompilationType,
                          MediaElch::Constants::CompilerString)
               << QStringLiteral("Using Qt version %1<br>").arg(qVersion())
               << QStringLiteral("System: %1 (%2)<br><br>").arg(QSysInfo::prettyProductName(), QSysInfo::buildAbi())
               << "Application dir: " << Settings::applicationDir() << "<br>"
               << "Settings file: " << Settings::instance()->settings()->fileName() << "<br>"
               << "Data dir: " << QStandardPaths::writableLocation(QStandardPaths::DataLocation) << "<br><br>";
    ui.txtDetails->setHtml(infos);
}
