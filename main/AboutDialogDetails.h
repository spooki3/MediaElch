#ifndef ABOUTDIALOGDETAILS_H
#define ABOUTDIALOGDETAILS_H

#include "ui_AboutDialogDetails.h"

#include <QDialog>

class AboutDialogDetails : public QDialog
{
    Q_OBJECT

public:
    explicit AboutDialogDetails(QWidget *parent = 0);
    ~AboutDialogDetails() = default;

private:
    Ui::AboutDialogDetails ui;
};

#endif // ABOUTDIALOGDETAILS_H
