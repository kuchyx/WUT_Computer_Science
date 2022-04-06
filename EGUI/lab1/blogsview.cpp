#include "blogsview.h"
#include "ui_blogsview.h"
#include "blogentry.h"
#include "ui_blogentry.h"
#include <algorithm>
#include <QJsonObject>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>

blogsView::blogsView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::blogsView)
{
    ui->setupUi(this);
    displayBlogEntries();
}

blogsView::~blogsView()
{
    delete ui;
}

void blogsView::setUserId(const QString &userId)
{
    this->userId = userId;
}

void blogsView::setBlogId(const QString &blogId)
{
    this->blogId = blogId;
}

QJsonObject blogsView::readJsonFile(const QString title)
{
    QFile file(title);
    file.open(QIODevice::ReadWrite);
    QByteArray bytes = file.readAll();
    file.close();
    QJsonDocument document = QJsonDocument::fromJson( bytes );
    return document.object();
}

void blogsView::saveJsonFile(QJsonObject &users, const QString name) const
{
    QFile jsonFile(name);
    QJsonDocument document;
    document.setObject( users );
    QByteArray bytes = document.toJson( QJsonDocument::Indented );
    jsonFile.open( QIODevice::WriteOnly | QIODevice::Text | QIODevice::Truncate );
    QTextStream iStream( &jsonFile );
    // iStream.setCodec( "utf-8" );
    iStream << bytes;
    jsonFile.close();
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
    e -> setBlogId(blogId);
    ui -> blogsLayout -> addWidget(e);
}

void blogsView::displayBlogEntries()
{
    QJsonObject blogsFile = readJsonFile("blogs.json");
    QJsonObject userBlog = blogsFile[blogId].toObject();
    QJsonArray blogEntries = userBlog["items"].toArray();
    for(int i = 0; i < blogEntries.size(); i++)
    {
        QJsonObject entry = (blogEntries.at(i)).toObject();
        blogEntry *e = new blogEntry();
        e -> setUserId(userId);
        e -> setUpBlogEntryFromJson(entry);
        ui -> blogsLayout -> addWidget(e);
    }


}

void blogsView::on_actionCreate_new_Blog_entry_triggered()
{
    createNewBlogEntry();
}

