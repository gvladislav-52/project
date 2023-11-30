#include "leftwidget.h"

LeftWidget::LeftWidget(QWidget *parent) : QWidget(parent)
{
    imageWidget = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap(":/ui/ford.jpg");
    layoutImage = new QVBoxLayout(this);
    layoutImage->addWidget(imageWidget);

    // Устанавливаем изображение и масштабируем его по размеру виджета
    imageWidget->setPixmap(pixmap);
    imageWidget->setScaledContents(true);
    imageWidget->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);
    imageWidget->setAlignment(Qt::AlignCenter);
}
