#include "blogentry.h"
#include "ui_blogentry.h"

blogEntry::blogEntry(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::blogEntry)
{
    ui->setupUi(this);
}

blogEntry::~blogEntry()
{
    delete ui;
}
