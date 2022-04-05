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

private slots:
    void on_saveEntry_clicked();
    void saveEntry();
    QJsonObject readJsonFile(const QString title);
    void saveJsonFile(QJsonObject &users, const QString name) const;

private:
    Ui::blogEntry *ui;
    QString userId;
    QString blogId;
};

#endif // BLOGENTRY_H
