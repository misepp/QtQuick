TEMPLATE = app

QT += qml quick core sql

CONFIG += c++11

SOURCES += main.cpp \
    contextprop.cpp

HEADERS += \
    contextprop.h

RESOURCES += qml.qrc

INCLUDEPATH += ../ActionLib ../ActionLib/build/debug
# E:\Qtwork\qt5\qtbase\src\widgets\kernel

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = %CD%


# Default rules for deployment.
include(deployment.pri)



#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../ActionLib/release/ -lActionLib
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../ActionLib/debug/ -lActionLib

LIBS += -L../../ActionLib/build/debug -lActionLib

#INCLUDEPATH += $$PWD/../ActionLib/debug
#INCLUDEPATH += $$PWD/../ActionLib

#INCLUDEPATH += ../ActionLib

##DEPENDPATH += $$PWD/../ActionLib/debug
##DEPENDPATH += $$PWD/../ActionLib
