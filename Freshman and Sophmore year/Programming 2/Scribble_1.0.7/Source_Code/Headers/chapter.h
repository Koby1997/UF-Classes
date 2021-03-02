#ifndef CHAPTER_H
#define CHAPTER_H

#include <QString>
#include <QDateTime>
#include "note.h"

class Chapter
{
public:
    Chapter();
    Chapter(QString ChapterName);
    Chapter(QString ChapterName, Note* note);
    void findDifferences(Note* note);
    bool isSynonym(QString word1, QString word2);
    void setMainNote(Note* note);
    Note* getMainNote();
    int compareSentences(QVector<QString> sentence1, QVector<QString> sentence2);
    QString getChapterName();
    void mergeNotes(Change* change);
private:
    QString chapterName;
    Note* mainNote;
};

#endif // CHAPTER_H
