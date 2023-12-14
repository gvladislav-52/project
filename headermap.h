#ifndef HEADERMAP_H
#define HEADERMAP_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QLabel>
#include <QObject>
#include <QTimer>
#include <QtWidgets>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QtXml>

class headerMap : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
    Q_PROPERTY(QString temperature READ temperature WRITE settemperature NOTIFY temperatureChanged FINAL)
public:
    headerMap(QObject *parent = nullptr);
    QString currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);

    QString temperature() const;
    void settemperature(const QString &newTemperature);

signals:
    void currentTimeChanged();

    void temperatureChanged();

private:
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
    QString temparature;

    QString m_temperature;

public slots:
    void currentTimeTimerTimeout();
    void temperatureSlot();
};

#endif // HEADERMAP_H
