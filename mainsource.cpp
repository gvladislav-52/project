#include "mainsource.h"
#include "leftsource.h"
#include <QRandomGenerator>
#include <QDateTime>
#include <QString>
#include <QDateTime>
#include <QDebug>

MainSource::MainSource(QObject *parent) : QObject(parent), m_currentTime("12:34am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout,this, &MainSource::currentTimeTimerTimeout);
    currentTimeTimerTimeout();

}

QString MainSource::currentTime() const
{
    return m_currentTime;
}

void MainSource::setcurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void MainSource::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm:ss");
    qDebug() << currentTime;
    setcurrentTime(currentTime);

    m_currentTimeTimer->start();
}

QUrl MainSource::getUrl()
{
    QUrl url(QStringLiteral("qrc:/MainQML.qml"));
    return url;
}

