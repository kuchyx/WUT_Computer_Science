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
    void loginUser(QJsonObject &users);
    QJsonObject readUserJsonFile();
    void wrongPassword();
    void loginSuccessful();


private slots:
    void on_loginButton_clicked();

private:
    Ui::login *ui;
};

#endif // LOGIN_H
