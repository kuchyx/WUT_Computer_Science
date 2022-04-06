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
#include <QtWidgets/QScrollArea>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_blogsView
{
public:
    QAction *actionCreate_new_Blog_entry;
    QAction *actionExit;
    QWidget *centralwidget;
    QGridLayout *gridLayout;
    QScrollArea *scrollArea;
    QWidget *scrollAreaWidgetContents;
    QGridLayout *gridLayout_2;
    QVBoxLayout *blogsLayout;
    QStatusBar *statusbar;
    QMenuBar *menubar;
    QMenu *menuManageBlogEntires;
    QMenu *menuExit;

    void setupUi(QMainWindow *blogsView)
    {
        if (blogsView->objectName().isEmpty())
            blogsView->setObjectName(QString::fromUtf8("blogsView"));
        blogsView->resize(800, 600);
        actionCreate_new_Blog_entry = new QAction(blogsView);
        actionCreate_new_Blog_entry->setObjectName(QString::fromUtf8("actionCreate_new_Blog_entry"));
        actionExit = new QAction(blogsView);
        actionExit->setObjectName(QString::fromUtf8("actionExit"));
        centralwidget = new QWidget(blogsView);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        gridLayout = new QGridLayout(centralwidget);
        gridLayout->setObjectName(QString::fromUtf8("gridLayout"));
        scrollArea = new QScrollArea(centralwidget);
        scrollArea->setObjectName(QString::fromUtf8("scrollArea"));
        scrollArea->setWidgetResizable(true);
        scrollAreaWidgetContents = new QWidget();
        scrollAreaWidgetContents->setObjectName(QString::fromUtf8("scrollAreaWidgetContents"));
        scrollAreaWidgetContents->setGeometry(QRect(0, 0, 780, 539));
        gridLayout_2 = new QGridLayout(scrollAreaWidgetContents);
        gridLayout_2->setObjectName(QString::fromUtf8("gridLayout_2"));
        blogsLayout = new QVBoxLayout();
        blogsLayout->setObjectName(QString::fromUtf8("blogsLayout"));

        gridLayout_2->addLayout(blogsLayout, 0, 0, 1, 1);

        scrollArea->setWidget(scrollAreaWidgetContents);

        gridLayout->addWidget(scrollArea, 0, 0, 1, 1);

        blogsView->setCentralWidget(centralwidget);
        statusbar = new QStatusBar(blogsView);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        blogsView->setStatusBar(statusbar);
        menubar = new QMenuBar(blogsView);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 19));
        menuManageBlogEntires = new QMenu(menubar);
        menuManageBlogEntires->setObjectName(QString::fromUtf8("menuManageBlogEntires"));
        menuExit = new QMenu(menubar);
        menuExit->setObjectName(QString::fromUtf8("menuExit"));
        blogsView->setMenuBar(menubar);

        menubar->addAction(menuManageBlogEntires->menuAction());
        menubar->addAction(menuExit->menuAction());
        menuManageBlogEntires->addAction(actionCreate_new_Blog_entry);
        menuExit->addAction(actionExit);

        retranslateUi(blogsView);

        QMetaObject::connectSlotsByName(blogsView);
    } // setupUi

    void retranslateUi(QMainWindow *blogsView)
    {
        blogsView->setWindowTitle(QCoreApplication::translate("blogsView", "MainWindow", nullptr));
        actionCreate_new_Blog_entry->setText(QCoreApplication::translate("blogsView", "Create blog entry", nullptr));
        actionExit->setText(QCoreApplication::translate("blogsView", "Exit", nullptr));
        menuManageBlogEntires->setTitle(QCoreApplication::translate("blogsView", "Blogs", nullptr));
        menuExit->setTitle(QCoreApplication::translate("blogsView", "App", nullptr));
    } // retranslateUi

};

namespace Ui {
    class blogsView: public Ui_blogsView {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_BLOGSVIEW_H
