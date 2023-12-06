#include "leftwidget.h"

LeftWidget::LeftWidget(QWidget *parent) : QWidget(parent)
{
    carButton();
}

void LeftWidget::carButton()
{
    QVBoxLayout *mainLayout = new QVBoxLayout(this);

    QQuickWidget *widget1 = new QQuickWidget(this);
    widget1->setMinimumHeight(100); // Установка минимальной высоты виджета
    mainLayout->addWidget(widget1, 1); // Установка соотношения размеров

    QQuickWidget *widget2 = new QQuickWidget(this);
    widget2->setSource(QUrl(QStringLiteral("qrc:/imageLeft.qml")));
    widget2->setResizeMode(QQuickWidget::SizeRootObjectToView);
    mainLayout->addWidget(widget2, 6); // Установка соотношения размеров

    QQuickWidget *widget3 = new QQuickWidget(this);
    widget3->setMinimumHeight(150); // Установка минимальной высоты виджета
    mainLayout->addWidget(widget3, 2); // Установка соотношения размеров

    mainLayout->setContentsMargins(0, 0, 0, 0);
}
