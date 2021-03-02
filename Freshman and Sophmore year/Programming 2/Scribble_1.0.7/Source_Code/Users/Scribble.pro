#-------------------------------------------------
#
# Project created by QtCreator 2017-03-18T20:25:12
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Scribble
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += main.cpp\
    courselist.cpp \
    course.cpp \
    textbook.cpp \
    chapter.cpp \
    note.cpp \
    change.cpp \
    addnotes.cpp \
    getdirectorywindow.cpp \
    coursewindow.cpp \
    differenceswidget.cpp \
    mainwindow.cpp \
    addcoursewindow.cpp \
    chapterinfowindow.cpp \
    additemwindow.cpp \
    potentialdiffwidget.cpp

HEADERS += \
    courselist.h \
    course.h \
    textbook.h \
    chapter.h \
    note.h \
    change.h \
    addnotes.h \
    getdirectorywindow.h \
    coursewindow.h \
    differenceswidget.h \
    mainwindow.h \
    addcoursewindow.h \
    chapterinfowindow.h \
    additemwindow.h \
    potentialdiffwidget.h

FORMS += \
    addnotes.ui \
    getdirectorywindow.ui \
    coursewindow.ui \
    differenceswidget.ui\
    addcoursewindow.ui\
    chapterinfowindow.ui\
    mainwindow.ui \
    additemwindow.ui \
    potentialdiffwidget.ui

RESOURCES += \
    resources.qrc\
