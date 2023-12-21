#include "rightsourcefile.h"
#include <QDateTime>
#include <QDebug>
#include <QRandomGenerator>
#include <QString>

RightSourceFile::RightSourceFile(QObject *parent)
    : QObject(parent)
    , m_currentTime("12:34am")
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(1000);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout, this, &RightSourceFile::currentTimeTimerTimeout);
    currentTimeTimerTimeout();
}

QString RightSourceFile::currentTime() const
{
    return m_currentTime;
}

void RightSourceFile::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void RightSourceFile::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm AP");
    //qDebug() << currentTime;
    setCurrentTime(currentTime);

    m_currentTimeTimer->start();
}
