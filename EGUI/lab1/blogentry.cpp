#include "blogentry.h"
#include "ui_blogentry.h"
#include <QDateTime>
#include <QJsonObject>
#include <QFile>
#include <QJsonDocument>
#include <QJsonArray>

blogEntry::blogEntry(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::blogEntry)
{
    ui->setupUi(this);
    QString Time = QTime::currentTime().toString();
    QString Date = QDate::currentDate().toString();
    ui -> dateTime -> setText(Date + " " + Time);

    qDebug() << "blogEntry id: " << userId;
    qDebug() << Time;
}

blogEntry::~blogEntry()
{
    delete ui;
}

void blogEntry::setUserId(const QString &userId)
{
    qDebug() << "blogEntry id: " << userId;
    this->userId = userId;
    ui -> ownerID -> setText("Owner ID: " + userId);
}

void blogEntry::setBlogId(const QString &blogId)
{
    this->blogId = blogId;
}


QJsonObject blogEntry::readJsonFile(const QString title)
{
    QFile file(title);
    file.open( QIODevice::ReadWrite);
    QByteArray bytes = file.readAll();
    file.close();
    QJsonDocument document = QJsonDocument::fromJson( bytes );
    return document.object();
}

void blogEntry::saveJsonFile(QJsonObject &users, const QString name) const
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


void blogEntry::saveEntry()
{

    ui -> textEdit -> setReadOnly(true);
    ui -> lineEdit -> setReadOnly(true);
    QJsonObject blogsFile = readJsonFile("blogs.json");
    QJsonObject blogEntryJson = blogsFile[blogId].toObject();
    QJsonObject entry;
    entry["title"] = ui -> lineEdit -> text();
    QString Time = QTime::currentTime().toString();
    QString Date = QDate::currentDate().toString();
    entry["datetime"] = Time + " " + Date;
    entry["content"] = ui -> textEdit -> toPlainText();
    QJsonArray items = blogEntryJson["items"].toArray();
    items.append(entry);
    blogEntryJson.insert("items", items);
    blogsFile.insert(blogId, blogEntryJson);
    saveJsonFile(blogsFile, "blogs.json");

}

void blogEntry::on_saveEntry_clicked()
{
    saveEntry();
}

