#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{
    ui->setupUi(this);
    setWidget();
    LeftWidgetMain();
    rightWidgetMain();
    basementWidgetMain();
}

void Widget::setWidget()
{
    this->setWindowTitle("Ford APP");
    this->resize(1280,720);
    this->setWindowFlags(Qt::Tool);
    setStyleSheet("background-color: black;");
    // Создание виджетов для каждой части
    headerWidget = new QWidget(this);
    mainContentWidget = new QWidget(this);
    leftWidget = new QWidget(mainContentWidget);
    rightWidget = new QWidget(mainContentWidget);
    basementWidget = new QWidget(this);

    // Создание компоновщиков
    mainLayout = new QVBoxLayout(this);
    contentLayout = new QHBoxLayout(mainContentWidget);

    // Установка отступов между содержимым главного виджета
    mainLayout->setContentsMargins(0, 0, 0, 0);
    mainLayout->setSpacing(0);

    // Установка отступов между виджетами
    contentLayout->setContentsMargins(0, 0, 0, 0);
    contentLayout->setSpacing(0);

    // Размещение виджетов в компоновщиках
    mainLayout->addWidget(headerWidget,1);
    mainLayout->addWidget(mainContentWidget,15);
    mainLayout->addWidget(basementWidget,2);

    contentLayout->addWidget(leftWidget,2);
    contentLayout->addWidget(rightWidget,5);

    //QMargins margins(0, 0, 0, 0);
    //headerWidget->setContentsMargins(margins);
    //leftWidget->setContentsMargins(margins);
    //rightWidget->setContentsMargins(margins);
    //basementWidget->setContentsMargins(margins);
}

void Widget::LeftWidgetMain()
{
    QLabel *imageWidget = new QLabel(leftWidget);

    // Загружаем изображение
    QPixmap pixmap(":/ui/tesla2.png");
    QVBoxLayout * layoutImage = new QVBoxLayout(leftWidget);
    layoutImage->addWidget(imageWidget);
    // Устанавливаем изображение и масштабируем его по размеру виджета
    imageWidget->setPixmap(pixmap);
    imageWidget->setScaledContents(true);
}

void Widget::rightWidgetMain()
{
    QQuickWidget *qwidget = new QQuickWidget(rightWidget);
    qwidget->setSource(QUrl("qrc:/map.qml"));
    qwidget->setResizeMode(QQuickWidget::SizeRootObjectToView);
    QVBoxLayout * layoutImage = new QVBoxLayout(rightWidget);
    layoutImage->addWidget(qwidget);
    layoutImage->setContentsMargins(0, 0, 0, 0);
}

void Widget::basementWidgetMain()
{
    QLabel *imageWidget = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap(":/ui/button_car.png");
    QLabel *imageWidget2 = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap2(":/ui/button_70.png");
    QLabel *imageWidget3 = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap3(":/ui/button_spotify.png");
    QLabel *imageWidget4 = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap4(":/ui/button_more.png");

    QLabel *imageWidget5 = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap5(":/ui/button_movie.png");
    QLabel *imageWidget6 = new QLabel(basementWidget);

    // Загружаем изображение
    QPixmap pixmap6(":/ui/button_70.png");
    QHBoxLayout * layoutImage = new QHBoxLayout(basementWidget);
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

Widget::~Widget()
{
    delete ui;
}

