#include "login.h"
#include "ui_login.h"
#include "blogsview.h"
#include "mainwindow.h"
#include "universalFunctions.h"
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
    defineConnections();
}

login::~login()
{
    delete ui;
}

void login::defineConnections() const
{
    connect(ui -> loginButton, &QPushButton::clicked, this, &login::loginUser);
    connect(ui -> registerButton, &QPushButton::clicked, this, &login::goRegister);
    connect(ui -> actionExit, &QAction::triggered, this, &login::exit);
    connect(ui -> actionLogin, &QAction::triggered, this, &login::loginUser);
    connect(ui -> actionRegister, &QAction::triggered, this, &login::goRegister);
}

void login::exit() const
{
    QApplication::quit();
}


void login::goRegister()
{
    MainWindow *r = new MainWindow();
    r -> show();
    hide();
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


void login::loginUser()
{
    QJsonObject users = readJsonFile("user.json");
    QJsonObject blogs = readJsonFile("blogs.json");
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
