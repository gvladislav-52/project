#ifndef LEFTSOURCEFILE_H
#define LEFTSOURCEFILE_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QLabel>
#include <QObject>
#include <QTimer>

class LeftSourceFile : public QObject
{
    Q_OBJECT

public:
    LeftSourceFile(QObject *parent = nullptr);


};

#endif // LEFTSOURCEFILE_H
