#include "login.h"
#include "ui_login.h"
#include "blogsview.h"
#include <QFileDialog>
#include <QMessageBox>
#include <iostream>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTextStream>

login::login(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::login)
{
    ui->setupUi(this);
}

login::~login()
{
    delete ui;
}

void login::thisIDDoesNotExist()
{
    QMessageBox idNotExisting;
    idNotExisting.setText("THIS ID DOES NOT EXIST!");
    idNotExisting.exec();
}

void login::wrongPassword()
{
    QMessageBox wrongPassword;
    wrongPassword.setText("WRONG PASSWORD!");
    wrongPassword.exec();
}

void login::loginSuccessful(const QString &id, const QString &blogId)
{
    qDebug() << "login id: " << id;
    blogsView *b = new blogsView();
    b -> setUserId(id);
    b -> setBlogId(blogId);
    b -> show();
    hide();
}


void login::loginUser(QJsonObject &users, QJsonObject &blogs)
{
    QString id = ui->inputLoginID_2->text();
    if(users.find(id) != users.end())
    {
        QJsonValue user = users.take(id);
        QString enteredPassword = ui->inputPassword->text();
        QString currentBlogId;
        if (user["password"] == enteredPassword)
        {
            QStringList keys = blogs.keys();
            for(int i = 0; i <= keys.size(); i++)
            {
                QJsonObject currentBlog = blogs[keys.at(i)].toObject();
                if(currentBlog["ownerId"] == id)
                {
                    currentBlogId = (currentBlog.take("blogId")).toString();
                    break;
                }
            }
            qDebug() << "Current blog id: " << currentBlogId;
            loginSuccessful(id, currentBlogId);
        }else wrongPassword();
    }else thisIDDoesNotExist();
}

QJsonObject login::readUserJsonFile(const QString &filename)
{
    QFile file(filename);
    file.open(QIODevice::ReadWrite);
    QByteArray bytes = file.readAll();
    file.close();
    QJsonDocument document = QJsonDocument::fromJson( bytes );
    return document.object();
}

void login::on_loginButton_clicked()
{
    QJsonObject users = readUserJsonFile("user.json");
    QJsonObject blogs = readUserJsonFile("blogs.json");
    loginUser(users, blogs);
}

