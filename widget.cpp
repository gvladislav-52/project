#include "widget.h"
#include "ui_widget.h"

Widget::Widget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Widget)
{
    ui->setupUi(this);
    setWidget();
}

void Widget::setWidget()
{
    this->setWindowTitle("Ford APP");
    this->resize(1280, 720);
    this->setStyleSheet("background-color: black;");

    // Создание виджетов для каждой части
    headerWidgetMain = new headerwidget(this);
    mainContentWidget = new QWidget(this);
    leftWidgetMain = new LeftWidget(this);
    rightWidgetMain = new RightWidget(this);
    basementWidgetMain = new basementwidget(this);

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
    mainLayout->addWidget(headerWidgetMain, 1);
    mainLayout->addWidget(mainContentWidget, 15);
    mainLayout->addWidget(basementWidgetMain, 2);

    contentLayout->addWidget(leftWidgetMain, 2);
    contentLayout->addWidget(rightWidgetMain, 5);
}

Widget::~Widget()
{
    delete ui;
}
