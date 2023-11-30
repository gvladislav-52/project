#ifndef HEADERWIDGET_H
#define HEADERWIDGET_H

#include <QWidget>

class headerwidget: public QWidget
{
    Q_OBJECT
public:
    explicit headerwidget(QWidget *parent = nullptr);
private:
    QWidget *headerWidget;
};

#endif // HEADERWIDGET_H
