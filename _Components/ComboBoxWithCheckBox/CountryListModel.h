#ifndef COUNTRYLISTMODEL_H
#define COUNTRYLISTMODEL_H
#include "MyCountry.h"
#include <QAbstractListModel>
#include <QObject>

class CountryListModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit CountryListModel(QObject *parent = nullptr);

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    QList<MyCountry*>m_countryList;
    void readCountriesFromFile(const QString &filePath);


    enum roleNames
    {
        COUNTRYNAME = 1,
        COUNTRYFLAG
    };
};

#endif // COUNTRYLISTMODEL_H
