#include "rightwidget.h"

RightWidget::RightWidget(QWidget *parent) : QWidget(parent)
{
    qwidget = new QQuickWidget(this);
    qwidget->setSource(QUrl(QStringLiteral("qrc:/MainRightWidget.qml")));
    qwidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    layoutImage = new QVBoxLayout(this);

    layoutImage->addWidget(qwidget);
    layoutImage->setContentsMargins(0, 0, 0, 0);
}

