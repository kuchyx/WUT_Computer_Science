/********************************************************************************
** Form generated from reading UI file 'login.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_LOGIN_H
#define UI_LOGIN_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_login
{
public:
    QWidget *centralwidget;
    QFormLayout *formLayout;
    QLabel *label;
    QLabel *label_2;
    QLineEdit *inputLoginID_2;
    QLabel *label_3;
    QLineEdit *inputPassword;
    QPushButton *loginButton;
    QPushButton *registerButton;
    QMenuBar *menubar;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *login)
    {
        if (login->objectName().isEmpty())
            login->setObjectName(QString::fromUtf8("login"));
        login->resize(800, 600);
        centralwidget = new QWidget(login);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        formLayout = new QFormLayout(centralwidget);
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        label = new QLabel(centralwidget);
        label->setObjectName(QString::fromUtf8("label"));

        formLayout->setWidget(0, QFormLayout::SpanningRole, label);

        label_2 = new QLabel(centralwidget);
        label_2->setObjectName(QString::fromUtf8("label_2"));

        formLayout->setWidget(1, QFormLayout::SpanningRole, label_2);

        inputLoginID_2 = new QLineEdit(centralwidget);
        inputLoginID_2->setObjectName(QString::fromUtf8("inputLoginID_2"));

        formLayout->setWidget(2, QFormLayout::SpanningRole, inputLoginID_2);

        label_3 = new QLabel(centralwidget);
        label_3->setObjectName(QString::fromUtf8("label_3"));

        formLayout->setWidget(3, QFormLayout::SpanningRole, label_3);

        inputPassword = new QLineEdit(centralwidget);
        inputPassword->setObjectName(QString::fromUtf8("inputPassword"));
        inputPassword->setEchoMode(QLineEdit::Password);

        formLayout->setWidget(4, QFormLayout::SpanningRole, inputPassword);

        loginButton = new QPushButton(centralwidget);
        loginButton->setObjectName(QString::fromUtf8("loginButton"));

        formLayout->setWidget(5, QFormLayout::SpanningRole, loginButton);

        registerButton = new QPushButton(centralwidget);
        registerButton->setObjectName(QString::fromUtf8("registerButton"));

        formLayout->setWidget(6, QFormLayout::SpanningRole, registerButton);

        login->setCentralWidget(centralwidget);
        menubar = new QMenuBar(login);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 19));
        login->setMenuBar(menubar);
        statusbar = new QStatusBar(login);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        login->setStatusBar(statusbar);

        retranslateUi(login);

        QMetaObject::connectSlotsByName(login);
    } // setupUi

    void retranslateUi(QMainWindow *login)
    {
        login->setWindowTitle(QCoreApplication::translate("login", "MainWindow", nullptr));
        label->setText(QCoreApplication::translate("login", "<html><head/><body><p align=\"center\"><span style=\" font-size:72pt;\">Login</span></p></body></html>", nullptr));
        label_2->setText(QCoreApplication::translate("login", "<html><head/><body><p align=\"center\"><span style=\" font-size:36pt;\">ID</span></p></body></html>", nullptr));
        label_3->setText(QCoreApplication::translate("login", "<html><head/><body><p align=\"center\"><span style=\" font-size:36pt;\">Password</span></p></body></html>", nullptr));
        loginButton->setText(QCoreApplication::translate("login", "Login", nullptr));
        registerButton->setText(QCoreApplication::translate("login", "Register", nullptr));
    } // retranslateUi

};

namespace Ui {
    class login: public Ui_login {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_LOGIN_H
