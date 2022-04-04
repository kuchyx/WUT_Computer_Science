#ifndef BLOGSVIEW_H
#define BLOGSVIEW_H

#include <QMainWindow>

namespace Ui {
class blogsView;
}

class blogsView : public QMainWindow
{
    Q_OBJECT

public:
    explicit blogsView(QWidget *parent = nullptr);
    ~blogsView();
    void createNewBlogEntry();

private slots:
    void on_actionCreate_new_Blog_entry_triggered();

private:
    Ui::blogsView *ui;
};

#endif // BLOGSVIEW_H
