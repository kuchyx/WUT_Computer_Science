#ifndef LOGIN_H
#define LOGIN_H

#include <QMainWindow>

namespace Ui {
class login;
}

class login : public QMainWindow
{
    Q_OBJECT

public:
    explicit login(QWidget *parent = nullptr);
    ~login();
    void thisIDDoesNotExist();
    void loginUser();
    void wrongPassword();
    void loginSuccessful(const QString &id, const QString &blogId);


private slots:

private:
    void defineConnections() const;
    void goRegister();
    void exit() const;
    Ui::login *ui;
};

#endif // LOGIN_H
