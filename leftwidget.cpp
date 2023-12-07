#include "leftwidget.h"

LeftWidget::LeftWidget(QWidget *parent) : QWidget(parent)
{
    mainLayout = new QVBoxLayout(this);
    carCharger(mainLayout);
    carButton(mainLayout);
    carSelect(mainLayout);
    mainLayout->setContentsMargins(0, 0, 0, 0);
}

void LeftWidget::carButton(QVBoxLayout *mainLayout)
{
    widget = new QQuickWidget(this);
    //widget->setStyleSheet("background-color: white;");
    widget->setSource(QUrl(QStringLiteral("qrc:/imageLeft.qml")));
    widget->setResizeMode(QQuickWidget::SizeRootObjectToView);

    QSpacerItem *spacerTop = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);
    QSpacerItem *spacerBottom = new QSpacerItem(0, 0, QSizePolicy::Minimum, QSizePolicy::Expanding);
    QSpacerItem *spacerLeft = new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum);
    QSpacerItem *spacerRight = new QSpacerItem(0, 0, QSizePolicy::Expanding, QSizePolicy::Minimum);

    mainLayout->addItem(spacerTop);
    mainLayout->addItem(spacerLeft);
    mainLayout->addItem(spacerRight);

    // Установка соотношения размеров
    int width = 6;
    int height = width * 2;
    mainLayout->addWidget(widget, height, Qt::AlignCenter);
    mainLayout->addItem(spacerBottom);
}

void LeftWidget::carCharger(QVBoxLayout *mainLayout)
{
    widget = new QQuickWidget(this);
    widget->setSource(QUrl(QStringLiteral("qrc:/carChargerWidget.qml")));
    widget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    mainLayout->addWidget(widget, 2); // Установка соотношения размеров
}

void LeftWidget::carSelect(QVBoxLayout *mainLayout)
{
    widget = new QQuickWidget(this);
    widget->setSource(QUrl(QStringLiteral("qrc:/carSelectWidget.qml")));
    widget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    mainLayout->addWidget(widget, 2); // Установка соотношения размеров
}
