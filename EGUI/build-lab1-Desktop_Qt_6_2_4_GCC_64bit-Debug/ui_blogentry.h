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
#include <QtWidgets/QCheckBox>
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
    QCheckBox *checkBox;
    QLineEdit *lineEdit;
    QLabel *ownerID;
    QLabel *dateTime;
    QTextEdit *textEdit;
    QPushButton *saveEntry;

    void setupUi(QWidget *blogEntry)
    {
        if (blogEntry->objectName().isEmpty())
            blogEntry->setObjectName(QString::fromUtf8("blogEntry"));
        blogEntry->resize(400, 300);
        formLayout = new QFormLayout(blogEntry);
        formLayout->setObjectName(QString::fromUtf8("formLayout"));
        checkBox = new QCheckBox(blogEntry);
        checkBox->setObjectName(QString::fromUtf8("checkBox"));

        formLayout->setWidget(0, QFormLayout::FieldRole, checkBox);

        lineEdit = new QLineEdit(blogEntry);
        lineEdit->setObjectName(QString::fromUtf8("lineEdit"));

        formLayout->setWidget(1, QFormLayout::FieldRole, lineEdit);

        ownerID = new QLabel(blogEntry);
        ownerID->setObjectName(QString::fromUtf8("ownerID"));

        formLayout->setWidget(2, QFormLayout::FieldRole, ownerID);

        dateTime = new QLabel(blogEntry);
        dateTime->setObjectName(QString::fromUtf8("dateTime"));

        formLayout->setWidget(3, QFormLayout::FieldRole, dateTime);

        textEdit = new QTextEdit(blogEntry);
        textEdit->setObjectName(QString::fromUtf8("textEdit"));
        textEdit->setReadOnly(false);

        formLayout->setWidget(4, QFormLayout::FieldRole, textEdit);

        saveEntry = new QPushButton(blogEntry);
        saveEntry->setObjectName(QString::fromUtf8("saveEntry"));

        formLayout->setWidget(5, QFormLayout::FieldRole, saveEntry);


        retranslateUi(blogEntry);

        QMetaObject::connectSlotsByName(blogEntry);
    } // setupUi

    void retranslateUi(QWidget *blogEntry)
    {
        blogEntry->setWindowTitle(QCoreApplication::translate("blogEntry", "Form", nullptr));
        checkBox->setText(QCoreApplication::translate("blogEntry", "Remove", nullptr));
        lineEdit->setText(QCoreApplication::translate("blogEntry", "Title", nullptr));
        ownerID->setText(QCoreApplication::translate("blogEntry", "ownerID", nullptr));
        dateTime->setText(QCoreApplication::translate("blogEntry", "Date Time", nullptr));
        saveEntry->setText(QCoreApplication::translate("blogEntry", "Save Entry", nullptr));
    } // retranslateUi

};

namespace Ui {
    class blogEntry: public Ui_blogEntry {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BLOGENTRY_H
