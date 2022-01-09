#include "todomodel.h"
#include "todolist.h"


ToDoModel::ToDoModel(QObject *parent)
    : QAbstractListModel(parent)
    , mList(nullptr)
{
}

// -----> Umozliwia dowiedzenie się ile elementów jest w modelu <----- //
int ToDoModel::rowCount(const QModelIndex &parent) const
{
    // Dla nieprawidłowego parent powinno zwrócić rozmiar listy. Dla wszystkich innych
    // (prawidłowych) parents, rowCount() zwróci 0
    if (parent.isValid() || !mList)
        return 0;

    // Zwraca rozmiar listy - w zależności od ToDoList
    return mList->items().size();
}

// -----> Zwraca dane z modelu do widoku <----- //
QVariant ToDoModel::data(const QModelIndex &index, int role) const
{
    if (!index.isValid() || !mList) // jeśli zapytasz o index który nie jest słuszny/poprawny
        return QVariant();  // nie mam poęcia o czym mówisz

    // ToDoItem zawiera done i Description
    const ToDoItem item = mList ->items().at(index.row());
    // Wybór możliwości!
    switch(role){
        case DoneRole: // jeśli pytam o CheckBox
            return QVariant(item.done);
        case DescriptionRole: // jeśli pytam o opis taska
            return QVariant(item.description);

    }
    return QVariant(); // jesli zapytasz o coś innego - zwróci QVariant - nie mam pojęcia o czym mówisz
}


// -----> Ustawia wartość ROLE dla okreslonego indeksu <----- //
bool ToDoModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(!mList)
        return false;
    ToDoItem item = mList -> items().at(index.row());
    switch(role){
        case DoneRole:
            item.done = value.toBool();
            break;
        case DescriptionRole:
            item.description = value.toString();
            break;

    }

    if (mList -> setItemAt(index.row(), item)) {

        emit dataChanged(index, index, QVector<int>() << role);
        return true;
    }
    return false;
}


// -----> Wskazuje czy element pod danym idneksem może byc edytowany, zaznaczony itp. <----- //
Qt::ItemFlags ToDoModel::flags(const QModelIndex &index) const
{
    if (!index.isValid())
        return Qt::NoItemFlags;
    // Jeśli edytowanie ma się odbywać w miejscu (w samym widoku), to metoda flags() musi zwrócić Qt::ItemIsEditable.
    return Qt::ItemIsEditable;
}

// -----> Kontener asocjacyjny indeksowany kluczem - dzięki temu rola może zostać użyta jako właściowśc w pliku QML <----- //
/**
 *  names[Klucz] = "wartość"
 *
 */
QHash<int, QByteArray> ToDoModel::roleNames() const
{
    QHash<int, QByteArray> names;
    names[DoneRole] = "done";
    names[DescriptionRole] = "description";
    return names;
}




// -----> Getter klasy ToDoList <----- //
ToDoList *ToDoModel::getList() const
{
    return mList;
}

// -----> Setter klasy ToDoList <----- //
void ToDoModel::setList(ToDoList *newList)
{
    beginResetModel();

    if(mList)
        mList->disconnect(this);
    mList = newList;

    if(mList) {
        connect(mList, &ToDoList::preItemAppended, this, [=]() {
            const int index = mList ->items().size();
            beginInsertRows(QModelIndex(), index, index);
        });
        connect(mList, &ToDoList::postItemAppedned, this, [=]() {
            endInsertRows();
        });
        connect(mList, &ToDoList::preItemRemoved, this, [=](int index) {
            beginRemoveRows(QModelIndex(), index, index);
        });
        connect(mList, &ToDoList::postItemRemoved, this, [=]() {
            endRemoveRows();
        });
    }
    endResetModel();
}
