#ifndef STRINGQML_H
#define STRINGQML_H

#include <QObject>

class StringQML : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString textValue READ getTextValue WRITE setTextValue NOTIFY textValueChanged)

public:
    explicit StringQML(QObject *parent = nullptr);

    QString getTextValue() const;
    void setTextValue(const QString &value);

signals:
    void textValueChanged();

private:
    QString m_textValue;
};

#endif // STRINGQML_H
