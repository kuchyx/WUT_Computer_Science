#ifndef BLOGENTRY_H
#define BLOGENTRY_H

#include <QWidget>
#include <QJsonObject>
#include <QFile>
#include <QJsonDocument>

namespace Ui {
class blogEntry;
}

class blogEntry : public QWidget
{
    Q_OBJECT

public:
    explicit blogEntry(QWidget *parent = nullptr);
    ~blogEntry();
    void setUserId(const QString &userId);
    void setBlogId(const QString &blogId);
    void setUpBlogEntryFromJson(const QJsonObject entry);

private slots:
    void on_saveEntry_clicked();
    void saveEntry();
    QJsonObject readJsonFile(const QString title);
    void saveJsonFile(QJsonObject &users, const QString name) const;
    void removeEntry();
    void on_pushButton_clicked();

    void on_editEntryButton_clicked();
    void editEntry();
    void saveEditedEntry();

private:
    Ui::blogEntry *ui;
    QString userId;
    QString blogId;
    QString dateTime;
    bool editMode;
};

#endif // BLOGENTRY_H
