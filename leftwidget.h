#ifndef LEFTWIDGET_H
#define LEFTWIDGET_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QLabel>

class LeftWidget : public QWidget
{
    Q_OBJECT

public:
    explicit LeftWidget(QWidget *parent = nullptr);

private:
    void carButton(QVBoxLayout *mainLayout);
    void carCharger(QVBoxLayout *mainLayout);
    void carSelect(QVBoxLayout *mainLayout);
    QQuickWidget *widget;
    QVBoxLayout *mainLayout;
};
#endif // LEFTWIDGET_H
