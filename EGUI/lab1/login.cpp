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

void login::loginSuccessful(const QString &id)
{
    qDebug() << "login id: " << id;
    blogsView *b = new blogsView();
    b -> setUserId(id);
    b -> show();
    hide();
}


void login::loginUser(QJsonObject &users)
{
    QString id = ui->inputLoginID_2->text();
    if(users.find(id) != users.end())
    {
        QJsonValue user = users.take(id);
        QString enteredPassword = ui->inputPassword->text();
        if (user["password"] == enteredPassword)
        {
            loginSuccessful(id);
        }else wrongPassword();
    }
}

QJsonObject login::readUserJsonFile()
{
    QFile file("user.json");
    file.open( QIODevice::ReadOnly);
    QByteArray bytes = file.readAll();
    file.close();
    QJsonDocument document = QJsonDocument::fromJson( bytes );
    return document.object();
}

void login::on_loginButton_clicked()
{
    QJsonObject users = readUserJsonFile();
    loginUser(users);
}

