#ifndef MYCOUNTRYCUSTOMMODEL_H
#define MYCOUNTRYCUSTOMMODEL_H
#include <QAbstractListModel>
#include <QObject>

class MyCountryCustomModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit MyCountryCustomModel(QObject *parent = nullptr);
public:
    int rowCount(const QModelIndex &parent) const;
    QVariant data(const QModelIndex &index, int role) const;
    QHash<int, QByteArray> roleNames() const;

    void loadCountriesFromXml();
private:
    QList<QString*>m_countryList;
    enum roleNames
    {
        COUNTRYNAME = 1
    };

signals:
};

#endif // MYCOUNTRYCUSTOMMODEL_H
