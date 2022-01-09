#ifndef APPLICATIONUI_H
#define APPLICATIONUI_H

#include <QObject>

class applicationui : public QObject
{
    Q_OBJECT
public:
    explicit applicationui(QObject *parent = nullptr);

    /* Swap theme from light to dark or from dark to light */
    Q_INVOKABLE QStringList swapThemePalette(QString nameTheme);

    /*Default Theme - it will be blue */
    Q_INVOKABLE QStringList defaultThemePalette();

    /* Get one of the Palette */
    Q_INVOKABLE QStringList primaryPalette(const int paletteIndex);

    /* Get one of the Accent Palette */
    Q_INVOKABLE QStringList accentPalette(const int paletteIndex);

    /* Get Default Primary Palette */
    Q_INVOKABLE QStringList defaultPrimaryPalette();

    /* Get Default Accent Palette */
    Q_INVOKABLE QStringList defaultAccentPalette();


signals:

private:
    bool mIsDarkTheme;
    bool mIsLightTheme;
    bool mIsBlueTheme;
    int mPrimaryPalette;
    int mAccentPalette;

};

#endif // APPLICATIONUI_H
