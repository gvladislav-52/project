#include "leftwidget.h"
#include <QTabWidget>
#include <QScrollArea>

LeftWidget::LeftWidget(QWidget *parent) : QWidget(parent)
{
    QTabWidget *tabWidget = new QTabWidget(this);
    tabWidget->setStyleSheet("QTabWidget{"
                             "border: none;"
                             "}"
                             "QTabWidget::pane{"
                             "border: 1px solid #222;"
                             "border-radius: 5px;"
                             "}");
    // Создание первого слайда с матрицей кнопок
    QWidget *firstSlide = new QWidget();
    QGridLayout *mainLayout = new QGridLayout(firstSlide);
    mainLayout->setSpacing(0);
    mainLayout->setContentsMargins(0, 0, 0, 0);
    // Разделение картинки на 12 частей (3x4 матрица)
    QPixmap originalPixmap(":/ui/carUP.png");
    int width = originalPixmap.width() / 3;
    int height = originalPixmap.height() / 4;

    // Создание кнопок и установка частей изображения в качестве иконок
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 4; j++) {
            QRect rect(i * width, j * height, width, height);
            QPixmap pixmap = originalPixmap.copy(rect);
            QToolButton *button = new QToolButton(this);
            button->setIcon(QIcon(pixmap));
            button->setIconSize(pixmap.size());
            // Установка политики размеров
            button->setSizePolicy(QSizePolicy::Ignored, QSizePolicy::Ignored);
            mainLayout->addWidget(button, j, i); // Обратите внимание, что индексы поменяны местами для отображения в виде матрицы
        }
    }

    tabWidget->addTab(firstSlide, "Button");

    // Создание второго слайда с масштабируемым изображением
    QWidget *secondSlide = new QWidget();
    QVBoxLayout *secondLayout = new QVBoxLayout(secondSlide);
    secondLayout->addStretch(); // Добавление растягиваемого пространства внизу
    //QLabel *imageLabel_Photo = new QLabel(this);
    //imageLabel_Photo->setPixmap(QPixmap(":/ui/carUP.png")); // Установка изображения
    //imageLabel_Photo->setScaledContents(true); // Установка свойства масштабирования содержимого
    //secondLayout->addWidget(imageLabel_Photo);

    // Убедитесь, что ваш второй слайд содержит прокручиваемую область
    tabWidget->addTab(secondSlide, "Image");

    QVBoxLayout *layout = new QVBoxLayout(this);
    layout->addWidget(tabWidget);
    setLayout(layout);
}

// QStackedLayout *stackedLayout = new QStackedLayout();

// // Создание QLabel для картинки
// QLabel *imageLabel = new QLabel(this);
// imageLabel->setPixmap(QPixmap(":/ui/carUP.png")); // Установка изображения
// stackedLayout->addWidget(imageLabel); // Добавление QLabel в QStackedLayout

// // Создание QPushButton для кнопки
// QPushButton *button = new QPushButton("Button", this);
// stackedLayout->addWidget(button); // Добавление QPushButton в QStackedLayout

// // Установка текущего индекса слоя на 0 (для отображения картинки)
// stackedLayout->setCurrentIndex(1);

// // Установка QStackedLayout в главный виджет
// setLayout(stackedLayout);
