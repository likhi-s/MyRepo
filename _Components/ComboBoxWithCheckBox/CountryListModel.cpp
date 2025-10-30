#include "CountryListModel.h"
#include <QDomDocument>
#include <QDomElement>
#include <QDomNode>
#include <QDomNodeList>
#include <QFile>
#include <QDebug>


CountryListModel::CountryListModel(QObject *parent)
    : QAbstractListModel{parent}
{
    this->readCountriesFromFile("countries.xml");
    for(auto i : m_countryList)
    {
        qDebug()<<"Country : "<<i->getCountryName();
        qDebug()<<"Image : "<<i->getCountryFlag();
    }
}

int CountryListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_countryList.size();
}

QVariant CountryListModel::data(const QModelIndex &index, int role) const
{
    MyCountry *country = m_countryList.at(index.row());
    switch (role) {
    case COUNTRYNAME:
        return country->getCountryName();
    case COUNTRYFLAG:
        return country->getCountryFlag();
    default:
        return QVariant();
    }
}

QHash<int, QByteArray> CountryListModel::roleNames() const
{
    QHash<int, QByteArray> l_roleNames;
    l_roleNames.insert(COUNTRYNAME, "COUNTRYNAME");
    l_roleNames.insert(COUNTRYFLAG,"COUNTRYFLAG");
    return l_roleNames;
}


void CountryListModel::readCountriesFromFile(const QString &filePath)
{
    // Clear existing list
    qDeleteAll(m_countryList);
    m_countryList.clear();

    QFile file(filePath);
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning() << "❌ Cannot open file:" << filePath;
        return;
    }

    QDomDocument doc;
    if (!doc.setContent(&file)) {
        qWarning() << "❌ Failed to parse XML file:" << filePath;
        file.close();
        return;
    }
    file.close();

    QDomElement root = doc.documentElement(); // <countries>
    if (root.tagName() != "countries") {
        qWarning() << "❌ Root element is not <countries>";
        return;
    }

    QDomNodeList countryNodes = root.elementsByTagName("country");
    for (int i = 0; i < countryNodes.count(); ++i) {
        QDomNode node = countryNodes.at(i);
        if (node.isElement()) {
            QDomElement elem = node.toElement();
            QString name = elem.firstChildElement("name").text();
            QString flag = elem.firstChildElement("flag").text();

            if (!name.isEmpty() && !flag.isEmpty()) {
                MyCountry* country = new MyCountry();
                country->setCountryName(name);
                country->setCountryFlag(flag);
                m_countryList.append(country);
            }
        }
    }
}
