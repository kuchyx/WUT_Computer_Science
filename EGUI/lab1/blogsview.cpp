#include "blogsview.h"
#include "ui_blogsview.h"
#include "blogentry.h"
#include "ui_blogentry.h"
#include <QJsonObject>
#include <QFile>
#include <QJsonDocument>

blogsView::blogsView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::blogsView)
{
    ui->setupUi(this);
}

blogsView::~blogsView()
{
    delete ui;
}

void blogsView::setUserId(const QString &userId)
{
    this->userId = userId;
}

QJsonObject blogsView::readJsonFile(const QString title)
{
    QFile file(title);
    file.open( QIODevice::ReadOnly);
    QByteArray bytes = file.readAll();
    file.close();
    QJsonDocument document = QJsonDocument::fromJson( bytes );
    return document.object();
}

void blogsView::createNewBlogEntry()
{
    QJsonObject blogsFile = readJsonFile("blogs.json");
    QJsonObject blogEntryJson;
    blogEntryJson["title"];
    blogEntryJson["datetime"];
    blogEntryJson["content"];
    qDebug() << "blogsView id: " << userId;
    blogEntry *e = new blogEntry();
    e -> setUserId(userId);
    ui -> blogsLayout -> addWidget(e);
}

void blogsView::on_actionCreate_new_Blog_entry_triggered()
{
    createNewBlogEntry();
}

