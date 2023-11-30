#ifndef RIGHTWIDGET_H
#define RIGHTWIDGET_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>

class RightWidget : public QWidget
{
    Q_OBJECT

public:
    explicit RightWidget(QWidget *parent = nullptr);

private:
    QQuickWidget *qwidget;
    QVBoxLayout *layoutImage;
};

#endif // RIGHTWIDGET_H

