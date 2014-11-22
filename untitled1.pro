TEMPLATE = app

QT += qml quick widgets

SOURCES += main.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = qrc://

# Default rules for deployment.
include(deployment.pri)

OTHER_FILES += \
    MathObj.qml \
    ObjManager.qml \
    Line.qml\
    myarray.js
