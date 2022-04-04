#ifndef BLOGENTRY_H
#define BLOGENTRY_H

#include <QWidget>

namespace Ui {
class blogEntry;
}

class blogEntry : public QWidget
{
    Q_OBJECT

public:
    explicit blogEntry(QWidget *parent = nullptr);
    ~blogEntry();

private:
    Ui::blogEntry *ui;
};

#endif // BLOGENTRY_H
