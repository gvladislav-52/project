#include "leftwidget.h"

LeftWidget::LeftWidget(QWidget *parent) : QWidget(parent)
{
    qwidget = new QQuickWidget(this);
    qwidget->setSource(QUrl(QStringLiteral("qrc:/imageLeft.qml")));
    qwidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    layoutImage = new QVBoxLayout(this);

    layoutImage->addWidget(qwidget);
    layoutImage->setContentsMargins(0, 0, 0, 0);
}

