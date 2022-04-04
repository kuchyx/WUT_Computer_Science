/********************************************************************************
** Form generated from reading UI file 'blogsview.ui'
**
** Created by: Qt User Interface Compiler version 6.2.4
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_BLOGSVIEW_H
#define UI_BLOGSVIEW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_blogsView
{
public:
    QAction *actionCreate_new_Blog_entry;
    QAction *actionDelete_blog_entry;
    QAction *actionEdit_blog_entry;
    QWidget *centralwidget;
    QGridLayout *gridLayout;
    QVBoxLayout *blogsLayout;
    QMenuBar *menubar;
    QMenu *menuManageBlogEntires;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *blogsView)
    {
        if (blogsView->objectName().isEmpty())
            blogsView->setObjectName(QString::fromUtf8("blogsView"));
        blogsView->resize(800, 600);
        actionCreate_new_Blog_entry = new QAction(blogsView);
        actionCreate_new_Blog_entry->setObjectName(QString::fromUtf8("actionCreate_new_Blog_entry"));
        actionDelete_blog_entry = new QAction(blogsView);
        actionDelete_blog_entry->setObjectName(QString::fromUtf8("actionDelete_blog_entry"));
        actionEdit_blog_entry = new QAction(blogsView);
        actionEdit_blog_entry->setObjectName(QString::fromUtf8("actionEdit_blog_entry"));
        centralwidget = new QWidget(blogsView);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        gridLayout = new QGridLayout(centralwidget);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        blogsLayout = new QVBoxLayout();
        blogsLayout->setObjectName(QString::fromUtf8("blogsLayout"));

        gridLayout->addLayout(blogsLayout, 0, 0, 1, 1);

        blogsView->setCentralWidget(centralwidget);
        menubar = new QMenuBar(blogsView);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 19));
        menuManageBlogEntires = new QMenu(menubar);
        menuManageBlogEntires->setObjectName(QString::fromUtf8("menuManageBlogEntires"));
        blogsView->setMenuBar(menubar);
        statusbar = new QStatusBar(blogsView);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        blogsView->setStatusBar(statusbar);

        menubar->addAction(menuManageBlogEntires->menuAction());
        menuManageBlogEntires->addAction(actionCreate_new_Blog_entry);
        menuManageBlogEntires->addAction(actionDelete_blog_entry);
        menuManageBlogEntires->addAction(actionEdit_blog_entry);

        retranslateUi(blogsView);

        QMetaObject::connectSlotsByName(blogsView);
    } // setupUi

    void retranslateUi(QMainWindow *blogsView)
    {
        blogsView->setWindowTitle(QCoreApplication::translate("blogsView", "MainWindow", nullptr));
        actionCreate_new_Blog_entry->setText(QCoreApplication::translate("blogsView", "Create blog entry", nullptr));
        actionDelete_blog_entry->setText(QCoreApplication::translate("blogsView", "Delete blog entry", nullptr));
        actionEdit_blog_entry->setText(QCoreApplication::translate("blogsView", "Edit blog entry", nullptr));
        menuManageBlogEntires->setTitle(QCoreApplication::translate("blogsView", "Blogs", nullptr));
    } // retranslateUi

};

namespace Ui {
    class blogsView: public Ui_blogsView {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BLOGSVIEW_H
