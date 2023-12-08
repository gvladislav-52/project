#include "widget.h"

#include <QApplication>

void Function_lol(QQmlApplicationEngine &engine, QGuiApplication &app, QUrl a)
{
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, &app, [a](QObject *obj, const QUrl &objUrl)
        {
            if(!obj && a == objUrl)
                QCoreApplication::exit(-1);
        },Qt::QueuedConnection);
}

int main(int argc, char *argv[])
{
#if QT_VERSION <QT_VERSION_CHECK(6,6,1)
    QCoreApplication::setAttribure(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app (argc, argv);

    SomeClass w;
    QUrl a = w.getUrl();
    QQmlApplicationEngine engine;
    Function_lol(engine,app,a);
    engine.load(a);
    QQmlContext*rootContext = engine.rootContext();
    rootContext->setContextProperty("classA",&w);
    return app.exec();
}
