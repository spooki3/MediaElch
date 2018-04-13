#ifndef ABOUTDIALOG_H
#define ABOUTDIALOG_H

#include <QDialog>

#include "AboutDialogDetails.h"

namespace Ui {
class AboutDialog;
} // namespace Ui
class AboutDialogDetails;

/**
 * @brief The AboutDialog class
 */
class AboutDialog : public QDialog
{
    Q_OBJECT

public:
    explicit AboutDialog(QWidget *parent = nullptr);
    ~AboutDialog() override;

public slots:
    int exec() override;

private:
    Ui::AboutDialog *ui;
    AboutDialogDetails *m_aboutDetails;
};

#endif // ABOUTDIALOG_H
