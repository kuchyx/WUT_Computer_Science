/****************************************************************************
** Meta object code from reading C++ file 'blogentry.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.2.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../lab1/blogentry.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'blogentry.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.2.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_blogEntry_t {
    const uint offsetsAndSize[24];
    char stringdata0[132];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(offsetof(qt_meta_stringdata_blogEntry_t, stringdata0) + ofs), len 
static const qt_meta_stringdata_blogEntry_t qt_meta_stringdata_blogEntry = {
    {
QT_MOC_LITERAL(0, 9), // "blogEntry"
QT_MOC_LITERAL(10, 20), // "on_saveEntry_clicked"
QT_MOC_LITERAL(31, 0), // ""
QT_MOC_LITERAL(32, 9), // "saveEntry"
QT_MOC_LITERAL(42, 12), // "readJsonFile"
QT_MOC_LITERAL(55, 5), // "title"
QT_MOC_LITERAL(61, 12), // "saveJsonFile"
QT_MOC_LITERAL(74, 12), // "QJsonObject&"
QT_MOC_LITERAL(87, 5), // "users"
QT_MOC_LITERAL(93, 4), // "name"
QT_MOC_LITERAL(98, 11), // "removeEntry"
QT_MOC_LITERAL(110, 21) // "on_pushButton_clicked"

    },
    "blogEntry\0on_saveEntry_clicked\0\0"
    "saveEntry\0readJsonFile\0title\0saveJsonFile\0"
    "QJsonObject&\0users\0name\0removeEntry\0"
    "on_pushButton_clicked"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_blogEntry[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   50,    2, 0x08,    1 /* Private */,
       3,    0,   51,    2, 0x08,    2 /* Private */,
       4,    1,   52,    2, 0x08,    3 /* Private */,
       6,    2,   55,    2, 0x108,    5 /* Private | MethodIsConst  */,
      10,    0,   60,    2, 0x08,    8 /* Private */,
      11,    0,   61,    2, 0x08,    9 /* Private */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::QJsonObject, QMetaType::QString,    5,
    QMetaType::Void, 0x80000000 | 7, QMetaType::QString,    8,    9,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void blogEntry::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<blogEntry *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->on_saveEntry_clicked(); break;
        case 1: _t->saveEntry(); break;
        case 2: { QJsonObject _r = _t->readJsonFile((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 3: _t->saveJsonFile((*reinterpret_cast< std::add_pointer_t<QJsonObject&>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 4: _t->removeEntry(); break;
        case 5: _t->on_pushButton_clicked(); break;
        default: ;
        }
    }
}

const QMetaObject blogEntry::staticMetaObject = { {
    QMetaObject::SuperData::link<QWidget::staticMetaObject>(),
    qt_meta_stringdata_blogEntry.offsetsAndSize,
    qt_meta_data_blogEntry,
    qt_static_metacall,
    nullptr,
qt_incomplete_metaTypeArray<qt_meta_stringdata_blogEntry_t
, QtPrivate::TypeAndForceComplete<blogEntry, std::true_type>
, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<QJsonObject, std::false_type>, QtPrivate::TypeAndForceComplete<const QString, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<QJsonObject &, std::false_type>, QtPrivate::TypeAndForceComplete<const QString, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>, QtPrivate::TypeAndForceComplete<void, std::false_type>


>,
    nullptr
} };


const QMetaObject *blogEntry::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *blogEntry::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_blogEntry.stringdata0))
        return static_cast<void*>(this);
    return QWidget::qt_metacast(_clname);
}

int blogEntry::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QWidget::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
