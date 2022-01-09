#ifndef TODOLIST_H
#define TODOLIST_H

#include <QObject>
#include <QVector>

// -----> Właściwości w pliku QML <----- //
struct ToDoItem{
    bool done;
    QString description;
};


class ToDoList : public QObject
{
    Q_OBJECT


public:
    explicit ToDoList(QObject *parent = nullptr);

    // Getter - zwracający mItems
    QVector<ToDoItem> items() const;

    // Setter - Ustawienie danego elementu pod danym indeksem
    bool setItemAt(int index, const ToDoItem &item);


// ===========================================================
// SIGNALS
// ===========================================================
signals:
    void preItemAppended();
    void postItemAppedned();

    void preItemRemoved(int index);
    void postItemRemoved();

// ===========================================================
// SLOTS - przyciśnięcie przycisku w UI powoduje wywołanie poniższych funkcji
// ===========================================================
public slots:
    void appendItem(QString);
    void removeCompletedItem(int currentIndex);

private:
    // Elementy znajdujace na liście
    QVector<ToDoItem> mItems;


};

#endif // TODOLIST_H
