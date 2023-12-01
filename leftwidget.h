#ifndef LEFTWIDGET_H
#define LEFTWIDGET_H

#include <QWidget>
#include <QLabel>
#include <QPixmap>
#include <QVBoxLayout>
#include <QPushButton>
#include <QStackedLayout>
#include <QToolButton>
#include <QSpacerItem>

class LeftWidget : public QWidget
{
    Q_OBJECT

public:
    explicit LeftWidget(QWidget *parent = nullptr);

private:
    QLabel *imageWidget;
    QVBoxLayout *layoutImage;
    QPushButton *button;
};

#endif // LEFTWIDGET_H
