#include "blogsview.h"
#include "ui_blogsview.h"
#include "blogentry.h"
#include "ui_blogentry.h"

blogsView::blogsView(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::blogsView)
{
    ui->setupUi(this);
}

blogsView::~blogsView()
{
    delete ui;
}

void blogsView::createNewBlogEntry()
{
    blogEntry *e = new blogEntry();
    e -> show();

}

void blogsView::on_actionCreate_new_Blog_entry_triggered()
{
    createNewBlogEntry();
}

