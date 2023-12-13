#ifndef HEADERMAP_H
#define HEADERMAP_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QLabel>
#include <QObject>
#include <QTimer>

class headerMap : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(int soundTemp READ soundTemp WRITE setSoundTemp NOTIFY soundTempChanged FINAL)
    Q_PROPERTY(int leftTemperat READ leftTemperat WRITE setleftTemperat NOTIFY leftTemperatChanged FINAL)
    Q_PROPERTY(int rightTemperat READ rightTemperat WRITE setrightTemperat NOTIFY rightTemperatChanged FINAL)
public:
    headerMap(QObject *parent = nullptr);
    QString currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    int soundTemp() const;
    void setSoundTemp(const int &newSoundTemp);

    int leftTemperat() const;
    void setleftTemperat(int newLeftTemperat);

    int rightTemperat() const;
    void setrightTemperat(int newRightTemperat);

signals:
    void currentTimeChanged();

    void soundTempChanged();

    void leftTemperatChanged();

    void rightTemperatChanged();

private:
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
    int m_soundTemp;

    int m_leftTemperat;

    int m_rightTemperat;

public slots:
    void currentTimeTimerTimeout();
    void setSoundSlotPlus();
    void setSoundSlotMinus();

    void setLeftSlotPlus();
    void setLeftSlotMinus();

    void setRightSlotPlus();
    void setRightSlotMinus();

};

#endif // HEADERMAP_H
