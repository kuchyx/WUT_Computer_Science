#ifndef UNIVERSALFUNCTIONS_H
#define UNIVERSALFUNCTIONS_H

#include <QJsonObject>

QJsonObject readJsonFile(const QString title);
void saveJsonFile(QJsonObject &users, const QString name);
void outputMessageBox(const QString messageBoxText);
void exit();


#endif // UNIVERSALFUNCTIONS_H
