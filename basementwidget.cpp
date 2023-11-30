#include "basementwidget.h"

basementwidget::basementwidget(QWidget *parent) : QWidget(parent)
{
    imageWidget = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap(":/ui/button_car.png");

    QLabel *imageWidget2 = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap2(":/ui/button_70.png");
    QLabel *imageWidget3 = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap3(":/ui/button_spotify.png");
    QLabel *imageWidget4 = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap4(":/ui/button_more.png");

    QLabel *imageWidget5 = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap5(":/ui/button_movie.png");
    QLabel *imageWidget6 = new QLabel(this);

    // Загружаем изображение
    QPixmap pixmap6(":/ui/button_70.png");
    QHBoxLayout *layoutImage = new QHBoxLayout(this);
    layoutImage->addWidget(imageWidget);
    layoutImage->addWidget(imageWidget2);
    layoutImage->addWidget(imageWidget3);
    layoutImage->addWidget(imageWidget4);
    layoutImage->addWidget(imageWidget5);
    layoutImage->addWidget(imageWidget6);
    // Устанавливаем изображение и масштабируем его по размеру виджета
    imageWidget->setPixmap(pixmap);
    imageWidget2->setPixmap(pixmap2);
    imageWidget3->setPixmap(pixmap3);
    imageWidget4->setPixmap(pixmap4);
    imageWidget5->setPixmap(pixmap5);
    imageWidget6->setPixmap(pixmap6);
}
