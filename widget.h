#ifndef WIDGET_H
#define WIDGET_H

#include <QWidget>
#include <QVBoxLayout>
#include <QLabel>
#include <QQuickWidget>

QT_BEGIN_NAMESPACE
namespace Ui { class Widget; }
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
    void LeftWidgetMain();
        void rightWidgetMain();
    void basementWidgetMain();
    // Создание виджетов для каждой части
    QWidget *mainContentWidget;
    QWidget *headerWidget;
    QWidget *leftWidget;
    QWidget *rightWidget;
    QWidget *basementWidget;

    // Создание компоновщиков
    QVBoxLayout *mainLayout;
    QHBoxLayout *contentLayout;

};


#endif // WIDGET_H
