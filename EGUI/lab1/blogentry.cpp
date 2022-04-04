#include "blogentry.h"
#include "ui_blogentry.h"
#include <QDateTime>

blogEntry::blogEntry(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::blogEntry)
{
    ui->setupUi(this);
    QString Time = QTime::currentTime().toString();
    QString Date = QDate::currentDate().toString();
    ui -> dateTime -> setText(Date + " " + Time);
    qDebug() << Time;
}

blogEntry::~blogEntry()
{
    delete ui;
}
