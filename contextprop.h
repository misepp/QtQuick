#ifndef CONTEXTPROP_H
#define CONTEXTPROP_H
#include <QObject>

//#define BOOST_FOREACH(list, index) for(index = 0; index < list.size(); index++)

class ActionLib;

class ContextProp : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int Points READ Points WRITE setPoints NOTIFY PointsChanged)
// SINGLETON IMPL ->
public:
    static ContextProp* getContextProp();

public:

    int Points() const
    {
        return points;
    }

    void setPoints(const int newValue)
    {
        if (newValue != points)
        points = newValue;
        emit PointsChanged(points);
    }

signals:
    void PointsChanged(int newValue);

private:
    ContextProp();
    ~ContextProp();

    ContextProp(const ContextProp*);
    const ContextProp* operator =(const ContextProp*);
    static ContextProp *instance;

    int points;
 // <- SINGLETON IMPL*/

/* NORMAL ->
public:
    ContextProp(QObject *parent);
    ~ContextProp();

public:

    Q_INVOKABLE int getPoints() const
    {
        return points;
    }

    Q_INVOKABLE void setPoints(const int newValue)
    {
        if (newValue != points)
        points = newValue;
        emit PointsChanged(points);
    }

signals:
    Q_INVOKABLE void PointsChanged(int newValue);

// -> NORMAL */



/* Q_GLOBAL_STATIC ->
public:
    ContextProp();
    ~ContextProp();
private:

 <- Q_GLOBAL_STATIC */

public:
    void CreateDB();


public:
Q_INVOKABLE QString saveData(QString var, int points);

private:
    ActionLib *Lib;

};

// Q_GLOBAL_STATIC ->
class Interface {

public:
    static ContextProp& getC();
};
// <- Q_GLOBAL_STATIC */
#endif // CONTEXTPROP_H

