#include <QDebug>

#include "contextprop.h"
#include "actionlib.h"

//ActionLib *ContextProp::Lib;
// SINGLETON IMPL ->
ContextProp* ContextProp::instance=0;
// <- SINGELTON IMPL */

/* Q_GLOBAL_STATIC ->
Q_GLOBAL_STATIC(ContextProp, inst)

ContextProp& Interface::getC()
{
    if (inst.exists())
        qDebug("EXISTS");
    else
        qDebug("DOESN'T EXIST");
    return *inst;
}
 <- Q_GLOBAL_STATIC */
ContextProp::ContextProp ()
{
    this->points = 0;

}
// SINGLETON IMPL ->
ContextProp* ContextProp::getContextProp()
{

    //static ContextProp *instance = nullptr;
    if (instance == 0) {
        instance = new ContextProp();
        qDebug("DOESN'T EXIST");
    }
    else {
        qDebug("EXISTS");
    }

    //static ContextProp instance;

    return instance;
}
// <- SINGLETON IMPL */

/* NORMAL ->
ContextProp::ContextProp(QObject *parent) : QObject(parent)
{
    this->points = 0;
}

// <- NORMAL  */

void ContextProp::CreateDB()
{
    Lib = new ActionLib(this);
    Lib->CreateDBCon();
}

QString ContextProp::saveData(QString var, int points)
{
    //int num = var.toInt();
    //num += 10;
    //return QVariant(num);
//#ifdef QT_DEBUG
        //return var+=10;
//#endif
    if(ContextProp::Lib->InsertData(var, points))
    {
        return QString(var + " SUCCESS");
    }
    else return QString(var + " FAIL!");
}


ContextProp::~ContextProp()
{

}

