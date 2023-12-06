#ifndef LEFTWIDGET_H
#define LEFTWIDGET_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>

class LeftWidget : public QWidget
{
    Q_OBJECT

public:
    explicit LeftWidget(QWidget *parent = nullptr);

private:
    void carButton();
    QQuickWidget *qwidget;
    QVBoxLayout *layoutImage;
};
#endif // LEFTWIDGET_H
