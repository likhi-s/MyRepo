#include "MyCountry.h"

MyCountry::MyCountry(QObject *parent)
    : QObject{parent}
{}

QString MyCountry::getCountryName() const
{
    return m_countryName;
}

void MyCountry::setCountryName(const QString &newCountryName)
{
    if (m_countryName == newCountryName)
        return;
    m_countryName = newCountryName;
    emit countryNameChanged();
}

QString MyCountry::getCountryFlag() const
{
    return m_countryFlag;
}

void MyCountry::setCountryFlag(const QString &newCountryFlag)
{
    if (m_countryFlag == newCountryFlag)
        return;
    m_countryFlag = newCountryFlag;
    emit countryFlagChanged();
}
