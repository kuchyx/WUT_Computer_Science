/********************************************************************************
** Form generated from reading UI file 'blogentry.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_BLOGENTRY_H
#define UI_BLOGENTRY_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QFormLayout>
#include <QtWidgets/QLabel>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextEdit>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_blogEntry
{
public:
    QFormLayout *formLayout;
    QLineEdit *lineEdit;
    QLabel *ownerID;
    QLabel *dateTime;
    QTextEdit *textEdit;
    QPushButton *saveEntry;
    QPushButton *pushButton;

    void setupUi(QWidget *blogEntry)
    {
        if (blogEntry->objectName().isEmpty())
            blogEntry->setObjectName(QString::fromUtf8("blogEntry"));
        blogEntry->resize(400, 300);
        formLayout = new QFormLayout(blogEntry);
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        lineEdit = new QLineEdit(blogEntry);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));

        formLayout->setWidget(0, QFormLayout::FieldRole, lineEdit);

        ownerID = new QLabel(blogEntry);
        ownerID->setObjectName(QString::fromUtf8("ownerID"));

        formLayout->setWidget(1, QFormLayout::FieldRole, ownerID);

        dateTime = new QLabel(blogEntry);
        dateTime->setObjectName(QString::fromUtf8("dateTime"));

        formLayout->setWidget(2, QFormLayout::FieldRole, dateTime);

        textEdit = new QTextEdit(blogEntry);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setReadOnly(false);

        formLayout->setWidget(3, QFormLayout::FieldRole, textEdit);

        saveEntry = new QPushButton(blogEntry);
        saveEntry->setObjectName(QString::fromUtf8("saveEntry"));

        formLayout->setWidget(4, QFormLayout::FieldRole, saveEntry);

        pushButton = new QPushButton(blogEntry);
        pushButton->setObjectName(QString::fromUtf8("pushButton"));

        formLayout->setWidget(5, QFormLayout::FieldRole, pushButton);


        retranslateUi(blogEntry);

        QMetaObject::connectSlotsByName(blogEntry);
    } // setupUi

    void retranslateUi(QWidget *blogEntry)
    {
        blogEntry->setWindowTitle(QCoreApplication::translate("blogEntry", "Form", nullptr));
        lineEdit->setText(QCoreApplication::translate("blogEntry", "Title", nullptr));
        ownerID->setText(QCoreApplication::translate("blogEntry", "ownerID", nullptr));
        dateTime->setText(QCoreApplication::translate("blogEntry", "Date Time", nullptr));
        saveEntry->setText(QCoreApplication::translate("blogEntry", "Save Entry", nullptr));
        pushButton->setText(QCoreApplication::translate("blogEntry", "Remove Entry", nullptr));
    } // retranslateUi

};

namespace Ui {
    class blogEntry: public Ui_blogEntry {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BLOGENTRY_H
