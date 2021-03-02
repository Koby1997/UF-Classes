#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "getdirectorywindow.h"
#include "addcoursewindow.h"
#include "chapterinfowindow.h"
#include "addnotes.h"
#include "note.h"
#include "additemwindow.h"
#include <QFileInfo>
#include <QFile>
#include <QDirIterator>
#include <QDebug>

//having issues if i declate it in header
ChapterInfoWindow *infoWindow = NULL;
AddNotes *noteWindow = NULL;
AddItemWindow *itemWindow = NULL;

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    currentItem = NULL;
    groupBoxLayout = new QVBoxLayout();
    itemToDel = NULL;
    pathname = QDir::homePath()+"/StateInfo/Directory_Path.txt";
    projectPath = "";

    ui->groupBox->setLayout(groupBoxLayout);

    initializeCourseList();
    loadCourseList();

}
bool MainWindow::initializeCourseList(){
    if(QFileInfo::exists(pathname)){
        QFile file(pathname);
         if (!file.open(QIODevice::ReadOnly | QIODevice::Text)){
            //file didnt open, ask user to set new directory
             GetDirectoryWindow window;
             window.setModal(true);
             window.exec();
         }

        projectPath = file.readAll();

        file.close();
        //check if project dir exists
        QDir dir(projectPath);
        if(!dir.exists()){
            GetDirectoryWindow window;
            window.setModal(true);
            window.exec();

            return initializeCourseList();
        }

        //go to project path and check for course dir
        traverseDir(projectPath);

        return true;
    }else{
        //ask user to set the project directory if it doesnt exist
        GetDirectoryWindow window;
        window.setModal(true);
        window.exec();

        return initializeCourseList();
    }
}
void MainWindow::traverseDir(QString path){
     QDir projectDir(path);
     if(projectDir.exists()){
         QStringList dirs = projectDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
         //add all the directories to courses list
         if(dirs.size() > 0){
             for(int i = 0; i < dirs.size(); i++){
                 //make course to add textbooks to
                 Course *course = new Course();
                 //set name
                 course->setCourseName(dirs.at(i));
                 //find all the textbooks and add it to the course
                 projectDir.cd(path + "/" + dirs.at(i));
                 QStringList bookDirs = projectDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
                 for(int j = 0; j < bookDirs.size();j++){
                    Textbook *temp = new Textbook();
                    temp->setTextbookName(bookDirs.at(j));
                    course->addTextbook(temp);
                 }
                 //find all the chapters and add them to the textbooks
                 for(int j = 0; j < course->getTextbooks().size();j++){
                    projectDir.cd(path + "/" + dirs.at(i) + "/"+ course->getTextbook(j)->getTextbookName());
                    QStringList chapterDirs = projectDir.entryList(QDir::Dirs | QDir::NoDotAndDotDot);
                    for(int x = 0; x < chapterDirs.size();x++){
                        Chapter* temp = new Chapter(chapterDirs.at(x));
                        course->getTextbook(j)->addChapter(temp);

                         projectDir.cd(path + "/" + dirs.at(i) + "/"+ course->getTextbook(j)->getTextbookName()+"/"+temp->getChapterName());
                         QStringList fileList = projectDir.entryList(QDir::Files | QDir::NoDotAndDotDot);
                         for(int y = 0; y < fileList.size();y++){
                             //make a note object for the
                             Note *note = new Note(projectDir.path() + "/"+fileList.at(y));
                             note->setFileName(fileList.at(y));
                             course->getTextbook(j)->getChapter(x)->setMainNote(note);
                         }
                    }
                 }
                //add this course to the list
                 courses.addCourse(course);
             }

         }else{
             qDebug() << "Project Directory doesnt exist";
         }
     }
}
//Add Course
QTreeWidgetItem* MainWindow::addRoot(QString name){
    //make treewidget item and set its parent to the treewidget
    QTreeWidgetItem *course = new QTreeWidgetItem(ui->courseList);
    //first parameter is the column number, the second is its name
    course->setText(0,name);

    return course;

}
//Add Textbook
QTreeWidgetItem* MainWindow::addChild(QTreeWidgetItem *parent, QString name){
    QTreeWidgetItem *itm = new QTreeWidgetItem();
    itm->setText(0,name);

    parent->addChild(itm);

    return itm;
}

//Add the courses to the treewidget as roots
void MainWindow::loadCourseList(){
    for(int i = 0; i < courses.getSize(); i++){
        //get the courses
        QTreeWidgetItem* root = addRoot(courses.getCourse(i)->getCourseName());
        for(int j = 0; j < courses.getCourse(i)->getTextbooks().size(); j++){
            //get the textbooks
           QTreeWidgetItem* parent  = addChild(root,courses.getCourse(i)->getTextbook(j)->getTextbookName());
            for(int x = 0; x < courses.getCourse(i)->getTextbook(j)->getChaptersList().size(); x++){
                //get the chapters
               QTreeWidgetItem* child = addChild(parent,courses.getCourse(i)->getTextbook(j)->getChapter(x)->getChapterName());
               QString filename = courses.getCourse(i)->getTextbook(j)->getChapter(x)->getMainNote()->getFileName();
               if(!filename.isEmpty())
                    addChild(child,filename);
            }
        }
    }

}

MainWindow::~MainWindow()
{
    delete ui;
}



//adds course to the tree widget and creates a directory for it
void MainWindow::on_addCourseBtn_clicked()
{
    AddCourseWindow window;
    window.setModal(true);
    window.exec();

    //get course and textbook form dialog window
    QString course = window.getCourseName();
    QString textbook = window.getTextbookName();
    QString chapter = window.getChapterName();
    //make sure it isnt blank
    if(!course.isEmpty() && !textbook.isEmpty() && !chapter.isEmpty()){
        QTreeWidgetItem* courseRoot = addRoot(course);
        QTreeWidgetItem* textbookItem = addChild(courseRoot,textbook);
        addChild(textbookItem,chapter);
        Course *crs = new Course();
        crs->setCourseName(course);
        Textbook *txtbook = new Textbook();
        txtbook->setTextbookName(textbook);
        Chapter *chapter1 = new Chapter(chapter);
        txtbook->addChapter(chapter1);
        crs->addTextbook(txtbook);
        courses.addCourse(crs);

        //make the directories
        QString path = projectPath;
        QDir dir(path);
        if(!dir.exists(course)){
            dir.mkdir(course);
        }
        path += "/"+ course;
        dir.cd(path);
        if(!dir.exists(textbook)){
            dir.mkdir(textbook);
        }
        path += "/"+textbook;
        dir.cd(path);
        if(!dir.exists(chapter)){
            dir.mkdir(chapter);
        }
    }

}

void MainWindow::on_courseList_itemClicked(QTreeWidgetItem *item, int column)
{
    //change name of delete button
    ui->deleteBtn->setText("Delete " + item->text(column));
    ui->groupBox->setTitle("Information of " + item->text(column));
    currentItem = item;
    itemToDel = item;
    if(item->parent() != NULL){
        int nestNum = countNest(item);
        if(nestNum == 1){
            //its a textbook
            if(noteWindow != NULL){
                noteWindow->hide();
            }
            if(infoWindow != NULL){
                infoWindow->hide();
            }
            if(itemWindow != NULL){
                const QString TITLE = "Chapter";
                itemWindow->setLabelName(TITLE);
                itemWindow->setButtonName(TITLE);
                itemWindow->show();
            }else{
                itemWindow = new AddItemWindow();
                itemWindow->setMainWidget(this);
                //set names of widgets
                const QString TITLE = "Chapter";
                itemWindow->setLabelName(TITLE);
                itemWindow->setButtonName(TITLE);
                groupBoxLayout->addWidget(itemWindow);
            }
        }else if(nestNum == 2){
           //its a chapter       
            //hide the note window if its shown
           if(noteWindow != NULL)
               noteWindow->hide();
           if(itemWindow != NULL)
               itemWindow->hide();
           if(infoWindow != NULL){
               if(item->childCount() > 0)
                   infoWindow->setButtonName("Merge a New Note");
               else
                   infoWindow->setButtonName("Add a New Note");
               infoWindow->show();
           }else{
               //make container for widgets
                infoWindow = new ChapterInfoWindow();
                infoWindow->setMainWidget(this);

                if(item->childCount() > 0)
                    infoWindow->setButtonName("Merge a New Note");
                else
                    infoWindow->setButtonName("Add a New Note");
                groupBoxLayout->addWidget(infoWindow);
           }
       }else if(nestNum == 3){
           //its a note
           //check if infowindow is shown and hide it if it is
           if(infoWindow != NULL)
                infoWindow->hide();
           if(itemWindow != NULL)
               itemWindow->hide();
           if(noteWindow != NULL){
               QString filepath = projectPath + "/" + getParentNames(item);
               noteWindow->setNote(filepath);
               noteWindow->show();
           }else{
                noteWindow = new AddNotes();
                QString filepath = projectPath + "/" + getParentNames(item);
                noteWindow->setNote(filepath);
                groupBoxLayout->addWidget(noteWindow);
           }

       }
    }else{
        //its a course
        if(noteWindow != NULL){
            noteWindow->hide();
        }
        if(infoWindow != NULL){
            infoWindow->hide();
        }
        if(itemWindow != NULL){
            const QString TITLE = "Textbook";
            itemWindow->setLabelName(TITLE);
            itemWindow->setButtonName(TITLE);
            itemWindow->show();
        }else{
            itemWindow = new AddItemWindow();
            itemWindow->setMainWidget(this);
            //set names of widgets
            const QString TITLE = "Textbook";
            itemWindow->setLabelName(TITLE);
            itemWindow->setButtonName(TITLE);
            groupBoxLayout->addWidget(itemWindow);
        }
    }
}
//makes a filepath using the treewidget
QString MainWindow::getParentNames(QTreeWidgetItem* parent){
    if(parent->parent() != NULL){
        //has a parent
        QString name = parent->text(0);
        parent = parent->parent();
        return getParentNames(parent) + "/" + name;
    }else{
        return parent->text(0);
    }
}
//counts the depth an item in the tree widget is
int MainWindow::countNest(QTreeWidgetItem *parent){
    int count  = 0;
   while(parent->parent() != NULL){
       count++;
       parent = parent->parent();
   }

   return count;
}

QTreeWidgetItem* MainWindow::getCurrentItem(){
    return currentItem;
}

void MainWindow::on_deleteBtn_clicked()
{
    if(itemToDel != NULL){
        //delete current item
        QTreeWidgetItem *temp = itemToDel;
        //hide the group box widgets if chapter or note is selected
            if(infoWindow != NULL){
                infoWindow->hide();
            }
            if(noteWindow != NULL){
                noteWindow->hide();
            }

        //-------------Delete the directories as well-----------//
        QString path = projectPath + "/" + getParentNames(itemToDel);
        int depth = this->countNest(itemToDel);
        if(depth == 3){
            //delete file
            QFile file(path);
            file.remove();
            delete temp;
            itemToDel = NULL;
            ui->deleteBtn->setText("Delete");
        }else{
            QDir dir(path);
            if(dir.exists()){
                dir.removeRecursively();
            }else{
                qDebug() << "Dir doesnt exist: " << path;
            }
            delete temp;
            itemToDel = NULL;
            ui->deleteBtn->setText("Delete");
            if(noteWindow != NULL){
                noteWindow->hide();
            }
            if(infoWindow != NULL){
                infoWindow->hide();
            }
            if(itemWindow != NULL){
                itemWindow->hide();
            }
            ui->groupBox->setTitle("Information");
        }
    }
}

QString MainWindow::getProjectPath(){
    return projectPath;
}

CourseList MainWindow::getCourseList(){
    return courses;
}
