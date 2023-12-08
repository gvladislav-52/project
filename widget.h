#ifndef WIDGET_H
#define WIDGET_H

#include <QLabel>
#include <QQuickWidget>
#include <QVBoxLayout>
#include <QVariant>
#include <QWidget>
#include <QtCore>
#include <QtGui>
#include <QtQuick>
#include "leftwidget.h"
#include "rightwidget.h"
#include "basementwidget.h"
#include "headerwidget.h"

class SomeClass : public QObject
{
    Q_OBJECT

public:
    SomeClass(QObject *parent = nullptr);
    QUrl getUrl();
    QString getStr();

private:
    void setWidget();
    LeftWidget *leftWidgetMain;
    RightWidget *rightWidgetMain;
    basementwidget *basementWidgetMain;
    headerwidget *headerWidgetMain;

    // Создание виджетов для каждой части
    QWidget *mainContentWidget;

    // Создание компоновщиков
    QVBoxLayout *mainLayout;
    QHBoxLayout *contentLayout;
};

#endif // WIDGET_H
