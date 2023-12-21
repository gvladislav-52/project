#ifndef LEFTSOURCEFILE_H
#define LEFTSOURCEFILE_H

#include <QLabel>
#include <QObject>
#include <QQuickWidget>
#include <QTimer>
#include <QVBoxLayout>
#include <QtQuick>

class LeftSourceFile : public QObject
{
    Q_OBJECT

public:
    LeftSourceFile(QObject *parent = nullptr);
};

#endif // LEFTSOURCEFILE_H
