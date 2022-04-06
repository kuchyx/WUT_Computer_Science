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
    void setUserId(const QString &userId);
    QJsonObject readJsonFile(const QString title);
    void saveJsonFile(QJsonObject &users, const QString name) const;
    void setBlogId(const QString &blogId);

private slots:
    void on_actionCreate_new_Blog_entry_triggered();
    void displayBlogEntries();


private:
    Ui::blogsView *ui;
    QString userId;
    QString blogId;
};

#endif // BLOGSVIEW_H
