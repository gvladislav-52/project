#include "headermap.h"
#include <QRandomGenerator>
#include <QDateTime>
#include <QString>
#include <QDateTime>
#include <QDebug>

headerMap::headerMap(QObject *parent) : QObject(parent), m_currentTime("12:34am")
{
    m_soundTemp = 0;
    m_leftTemperat = 15;
    m_rightTemperat = 15;
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(1000);
    m_currentTimeTimer->setSingleShot(true);
    connect(m_currentTimeTimer, &QTimer::timeout,this, &headerMap::currentTimeTimerTimeout);
    currentTimeTimerTimeout();
}

QString headerMap::currentTime() const
{
    return m_currentTime;
}

void headerMap::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void headerMap::currentTimeTimerTimeout()
{
    QDateTime dateTime;
    QString currentTime = dateTime.currentDateTime().toString("hh:mm AP");
    //qDebug() << currentTime;
    setCurrentTime(currentTime);

    m_currentTimeTimer->start();
}

void headerMap::setSoundSlotPlus()
{
    if(m_soundTemp <20)
        m_soundTemp++;
    emit soundTempChanged();
}

void headerMap::setSoundSlotMinus()
{
    if(m_soundTemp > 0)
        m_soundTemp--;
    emit soundTempChanged();
}

void headerMap::setLeftSlotPlus()
{
    if(m_leftTemperat < 29)
    {
        if(m_rightTemperat < 29)
        {
            if((m_rightTemperat-m_leftTemperat == 4) || (m_rightTemperat-m_leftTemperat == -4))
            {
                m_rightTemperat++;
                emit rightTemperatChanged();
            }
        }
        m_leftTemperat++;
    }
    emit leftTemperatChanged();
}

void headerMap::setLeftSlotMinus()
{
    if(m_leftTemperat > 15)
    {
        if(m_rightTemperat > 15)
            if((m_rightTemperat-m_leftTemperat == 4) || (m_rightTemperat-m_leftTemperat == -4))
            {
                m_rightTemperat--;
                emit rightTemperatChanged();
            }
        m_leftTemperat--;
    }
    emit leftTemperatChanged();
}

void headerMap::setRightSlotPlus()
{
    if(m_rightTemperat < 29)
    {
        if(m_leftTemperat < 29)
        {
            if((m_rightTemperat-m_leftTemperat == 4) || (m_rightTemperat-m_leftTemperat == -4))
            {
                m_leftTemperat++;
                emit leftTemperatChanged();
            }
        }
        m_rightTemperat++;
    }
    emit rightTemperatChanged();
}

void headerMap::setRightSlotMinus()
{
    if(m_rightTemperat > 15)
    {
        if(m_leftTemperat > 15)
            if((m_rightTemperat-m_leftTemperat == 4) || (m_rightTemperat-m_leftTemperat == -4))
            {
                m_leftTemperat--;
                emit leftTemperatChanged();
            }
        m_rightTemperat--;
    }
    emit rightTemperatChanged();
}


int headerMap::soundTemp() const
{
    return m_soundTemp;
}

void headerMap::setSoundTemp(const int &newSoundTemp)
{
    if (m_soundTemp == newSoundTemp)
        return;
    m_soundTemp = newSoundTemp;
    emit soundTempChanged();
}

int headerMap::leftTemperat() const
{
    return m_leftTemperat;
}

void headerMap::setleftTemperat(int newLeftTemperat)
{
    if (m_leftTemperat == newLeftTemperat)
        return;
    m_leftTemperat = newLeftTemperat;
    emit leftTemperatChanged();
}

int headerMap::rightTemperat() const
{
    return m_rightTemperat;
}

void headerMap::setrightTemperat(int newRightTemperat)
{
    if (m_rightTemperat == newRightTemperat)
        return;
    m_rightTemperat = newRightTemperat;
    emit rightTemperatChanged();
}
