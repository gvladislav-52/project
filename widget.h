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

QT_BEGIN_NAMESPACE
namespace Ui {
class Widget;
}
QT_END_NAMESPACE

class Widget : public QWidget
{
    Q_OBJECT

public:
    Widget(QWidget *parent = nullptr);
    ~Widget();

private:
    Ui::Widget *ui;
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
