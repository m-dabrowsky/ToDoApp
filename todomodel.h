#ifndef TODOMODEL_H
#define TODOMODEL_H

#include <QAbstractListModel>

class ToDoList;


class ToDoModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(ToDoList *list READ getList WRITE setList);
public:
    explicit ToDoModel(QObject *parent = nullptr);


    /**
     *  Dane jakie będą przechowywane
     */
    enum {
        DoneRole = Qt::UserRole,
        DescriptionRole
    };

    // ===========================================================
    // CREATED AUTOMATICALLY
    // ===========================================================

    // Wymagane ! (Podstawowa Funkcjonalność)
    /**
     *  rowCount = liczba wierszy w modelu
     *  data = dostarcza dane do widoku (Zwraca wartość Qvariant dla okreslonego argumentu index i rola)
     *  role = pytasię jakie dane chcesz wyświetlić: nazwe, kolor?
     *  index = numer wiersza
     *  Qt::DisplayRole = reprezentuje widoczną wartość np. w tabeli
     */
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const override;



    // -----> W przypadku modeli edytowalnych trzeba przesłonić metody flags() i setData(). <----- //
    /**
     *  setData = ustawienie wartości roli ROLE dla okreslone indeksu na podaną wartość.
     *            Jeśli operacja się powiedzie, zwraca true i wysyła sygnał dataChanged()
     *  flags = zwraca wyniki operacji OR, aby wskazać czy element pod określonym indeksem jest włączyny i
     *          można go zaznaczyć, edytować, wybrać itp.
     *
     */
    bool setData(const QModelIndex &index, const QVariant &value, int role = Qt::EditRole) override;
    Qt::ItemFlags flags(const QModelIndex& index) const override;


    // -----> Role elementów listy muszą być zmappowane do właściowsci QML  <----- //
    virtual QHash<int, QByteArray> roleNames() const override;


    // ===========================================================
    // CREATED BY Q_PROPERTY
    // ===========================================================

    // -----> Getter i Setter klasy ToDoLisy <----- //
    ToDoList *getList() const;
    void setList(ToDoList *newList);

private:
    ToDoList *mList;

};

#endif // TODOMODEL_H
