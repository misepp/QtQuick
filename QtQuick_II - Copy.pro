TEMPLATE = app

QT += qml quick core
CONFIG += c++11

SOURCES += main.cpp \
    contextprop.cpp

HEADERS += \
    contextprop.h

RESOURCES += qml.qrc

INCLUDEPATH += E:\Qtwork\qt5\qtbase\src\widgets\kernel

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = %CD%


# Default rules for deployment.
include(deployment.pri)


