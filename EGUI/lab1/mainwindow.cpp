#include "mainwindow.h" // Notepad class header file that was generated by the wizard
#include "ui_mainwindow.h" // UI header file that was generated by the uic tool
#include <QFileDialog>
#include <QMessageBox>
#include <iostream>
#include <QJsonObject>
#include <QJsonDocument>
#include <QTextStream>

MainWindow::MainWindow(QWidget *parent) // class definition, constructor
    : QMainWindow(parent) // calls qmainwindow parent constructor we have,
    // base class for the MainWindow class:
    , ui(new Ui::MainWindow) // create ui class and assign to ui member
    // creates the UI class instance and assigns it to the ui member:
{
    ui->setupUi(this); // setup user interface
}

MainWindow::~MainWindow()
{
    delete ui; // in the destructor, we delete the ui
}

void MainWindow::saveJsonFile(QJsonObject &json) const
{
    QFile jsonFile(QStringLiteral("save.json"));
    QJsonDocument document;
    document.setObject( json );
    QByteArray bytes = document.toJson( QJsonDocument::Indented );
    jsonFile.open( QIODevice::WriteOnly | QIODevice::Text | QIODevice::Truncate );
    QTextStream iStream( &jsonFile );
    // iStream.setCodec( "utf-8" );
    iStream << bytes;
    jsonFile.close();
}

void MainWindow::saveRegisteredUser(QJsonObject &json) const
{

    QString mail = ui->inputMail->text();
    QString password = ui->inputPassword->text();
    qDebug() << mail << " " << password;
    json["mail"] = mail;
    json["password"]=password;
    saveJsonFile(json);
}


void MainWindow::on_pushButton_clicked()
{
    QJsonObject saveFile;
    saveRegisteredUser(saveFile);
}

