#ifndef RIGHTSOURCEFILE_H
#define RIGHTSOURCEFILE_H

#include <QLabel>
#include <QObject>
#include <QQuickWidget>
#include <QTimer>
#include <QVBoxLayout>
#include <QtQuick>

class RightSourceFile : public QObject
{
    Q_OBJECT
    Q_PROPERTY(
        QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)

public:
    RightSourceFile(QObject *parent = nullptr);
    QString currentTime() const;
    QUrl getUrl();

    void setCurrentTime(const QString &newCurrentTime);

signals:
    void currentTimeChanged();

private:
    QString m_currentTime;
    QTimer *m_currentTimeTimer;
public slots:
    void currentTimeTimerTimeout();
};

#endif // RIGHTSOURCEFILE_H
