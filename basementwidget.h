#ifndef BASEMENTWIDGET_H
#define BASEMENTWIDGET_H

#include <QWidget>
#include <QLabel>
#include <QPixmap>
#include <QHBoxLayout>

class basementwidget: public QWidget
{
    Q_OBJECT
public:
    explicit basementwidget(QWidget *parent = nullptr);

private:
    QLabel *imageWidget;
};

#endif // BASEMENTWIDGET_H
