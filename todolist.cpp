#include "todolist.h"
#include <QDebug>
ToDoList::ToDoList(QObject *parent) : QObject(parent)
{
    mItems.append({true, QStringLiteral("Wash the car")});
    mItems.append({true, QStringLiteral("Hello there")});
}


// ===========================================================
// GETTER
// ===========================================================
QVector<ToDoItem> ToDoList::items() const
{
    return mItems;
}

// ===========================================================
// SETTER
// ===========================================================
bool ToDoList::setItemAt(int index, const ToDoItem &item)
{
    if(index < 0 || index >= mItems.size())
        return false;

    const ToDoItem &oldItem = mItems.at(index);
    if(item.done == oldItem.done && item.description == oldItem.description)
        return false;

    mItems[index] = item;
    return true;
}


// ===========================================================
// SLOTS
// ===========================================================

// -----> Dodanie nowego elementu <----- //
void ToDoList::appendItem(QString txt)
{
    emit preItemAppended();

    ToDoItem item;
    item.done = false;
    item.description = txt;
    mItems.append(item);

    emit postItemAppedned();
}

// -----> Usunięcie elementu <----- //
void ToDoList::removeCompletedItem(int currentIndex)
{
    //for(int i=0; i<mItems.size(); ){
        if(mItems.at(currentIndex).done){
            emit preItemRemoved(currentIndex);
            mItems.removeAt(currentIndex);

            emit postItemRemoved();
            //break;
        }
        //else {
//            ++i;
//        }
   // }
}


