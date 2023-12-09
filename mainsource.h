#ifndef MAINSOURCE_H
#define MAINSOURCE_H

#include <QQuickWidget>
#include <QVBoxLayout>
#include <QtQuick>
#include <QLabel>
#include <QObject>
#include <QTimer>

class MainSource : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)

public:
    MainSource(QObject *parent = nullptr);
    void setcurrentTime(const QString &newCurrentTime);
    QString currentTime() const;
    QUrl getUrl();

signals:
    void currentTimeChanged();

private:
    QString m_currentTime;
    QTimer * m_currentTimeTimer;
public slots:
    void currentTimeTimerTimeout();
    //QString getStr();

};

#endif // MAINSOURCE_H
