#include "leftsourcefile.h"
#include "rightsourcefile.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>

int main(int argc, char *argv[])
{
#if QT_VERSION <QT_VERSION_CHECK(6,6,1)
    QCoreApplication::setAttribure(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app (argc, argv);

    LeftSourceFile leftSource;
    RightSourceFile rightSource;
    QQmlApplicationEngine engine;
    const QUrl url (QStringLiteral("qrc:/MainQML.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [url](QObject *obj, const QUrl &objUrl)
        {
            if(!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },Qt::QueuedConnection);

    engine.load(url);
    QQmlContext*rootContext = engine.rootContext();
    //rootContext->setContextProperty("leftClass",&leftSource);
    rootContext->setContextProperty("rightClass",&rightSource);
    return app.exec();
}
