//#include <QApplication>
//#include <QQmlApplicationEngine>
#include <QQuickWindow>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QGuiApplication>

#include <QDebug>

#include "contextprop.h"
#include "actionlib.h"
//void manipulate(int* pointer);

void manipulate(int *pointer) {
    *pointer = 67;
}

void manipulate2(int &ref) {
    ref = 300;
}

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    /*
    QQuickView* item = new  QQuickView();
    item->setParent(&window);
    */
    int num = 5;
    int *pointer = &num;
    qDebug() << pointer << " " << *pointer;
    manipulate(pointer);
    qDebug() << num;

    int &ref = num;
    manipulate2(*pointer);
    qDebug() << num;


/*
    QQmlEngine engine;
    QQmlComponent component(&engine, QUrl("qrc:/main.qml"));
    QQuickItem *item = qobject_cast<QQuickItem *>(component.create());
*/

    QQmlApplicationEngine engine;
    //SINGLETON ->
    ContextProp::getContextProp()->CreateDB();
    engine.rootContext()->setContextProperty("dataStorage", ContextProp::getContextProp());
    //<- SINGLETON */

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //Setting the context property
    /* NORMAL ->
    ContextProp *prop = new ContextProp(&engine);
    //ContextProp *prop = ContextProp::getContextProp();
    engine.rootContext()->setContextProperty("dataStorage", prop);
    // <- NORMAL */

    /* Q_GLOBAL_STATIC ->
    Interface::getC().CreateDB();
    engine.rootContext()->setContextProperty("dataStorage", &Interface::getC());
    <- Q_GLOBAL_STATIC */

    QQuickWindow *window = qobject_cast<QQuickWindow*>(engine.rootObjects().at(0));
    if (!window)
    {
        qFatal("Error: Your root item has to be a window");
        return -1;
    }
    //window->setWidth(800);
    //window->setHeight(650);
    //window->setWidth(500);
    //window->setHeight(500);
    window->show();

    //QQmlApplicationEngine engine;
    //engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    /*
    QQuickView view;
    view.setSource(QUrl("qrc:/main.qml"));
    //item->setParent(&view);
    view.show();
*/


    return app.exec();
}
