#include "MyCountryCustomModel.h"
#include <QFile>
#include <QXmlStreamReader>
#include <QList>
#include <QString>
#include <QDebug>

MyCountryCustomModel::MyCountryCustomModel(QObject *parent)
    : QAbstractListModel{parent}
{
    loadCountriesFromXml();


}

int MyCountryCustomModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_countryList.size();
}

QVariant MyCountryCustomModel::data(const QModelIndex &index, int role) const
{

    switch (role) {
    case COUNTRYNAME:
        return m_countryList.at(index.row());
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> MyCountryCustomModel::roleNames() const
{
    QHash<int, QByteArray> l_roleNames;
    l_roleNames.insert(COUNTRYNAME, "countryName");
    return l_roleNames;
}

void MyCountryCustomModel::loadCountriesFromXml()
{
    QFile file("countries.xml");

    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "Failed to open file:" << "countries.xml";
        return;
    }

    QXmlStreamReader xml(&file);

    beginResetModel();
    m_countryList.clear();

    while (!xml.atEnd() && !xml.hasError()) {
        QXmlStreamReader::TokenType token = xml.readNext();
        if (token == QXmlStreamReader::StartElement && xml.name() == "Country") {
            QString countryName = xml.readElementText();
            m_countryList.append(countryName);
        }
    }

    endResetModel();

    file.close();


}
