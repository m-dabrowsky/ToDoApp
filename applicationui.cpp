#include "applicationui.h"
#include "colors.h"

using namespace appColors;



applicationui::applicationui(QObject *parent) : QObject(parent)
{
    // domyślnie theme jest blue
    mIsDarkTheme = false;
    mIsLightTheme = false;
    mIsBlueTheme = true;
    // default primary color is BlueGrey
    mPrimaryPalette = 0;
    // default accent color is orange
    mAccentPalette = 7;
}



/* Zmiana Theme Palette */
QStringList applicationui::swapThemePalette(QString nameTheme)
{
    mIsDarkTheme = false;
    mIsLightTheme = false;
    mIsBlueTheme = false;

    if(nameTheme == "Dark Theme") {
        mIsDarkTheme = !mIsDarkTheme;
        if (mIsDarkTheme) {
            return darkPalette;
        }
    }
    else if(nameTheme == "Light Theme") {
        mIsLightTheme = !mIsLightTheme;
        if (mIsLightTheme) {
            return lightPalette;
        }
    }

    return bluePalette;
}


/*
 * Domyślnie wyświetlane są kolory z lightPalette, jeśli
 * w opcjach zmieni się mIsDarkTheme na True to
 * aplikacja zmieni kolory na darkPalette
 */
QStringList applicationui::defaultThemePalette()
{
    if (mIsDarkTheme) {
        return darkPalette;
    }
    if (mIsLightTheme) {
        return lightPalette;
    }
    return bluePalette;

}

/* Get one of the Primary Palettes */
/*
 * Wywoływana kiedy użytkownik w ustawieniach bedzie chciał
 * zmienić kolor podstawowy
 */
QStringList applicationui::primaryPalette(const int paletteIndex)
{
    mPrimaryPalette = paletteIndex;
    switch (paletteIndex) {
    case 0:
        return materialBasic;
        break;
    case 1:
        return materialRed;
        break;
    case 2:
        return materialPink;
        break;
    case 3:
        return materialPurple;
        break;
    case 4:
        return materialDeepPurple;
        break;
    case 5:
        return materialIndigo;
        break;
    case 6:
        return materialBlue;
        break;
    case 7:
        return materialLightBlue;
        break;
    case 8:
        return materialCyan;
        break;
    case 9:
        return materialTeal;
        break;
    case 10:
        return materialGreen;
        break;
    case 11:
        return materialLightGreen;
        break;
    case 12:
        return materialLime;
        break;
    case 13:
        return materialYellow;
        break;
    case 14:
        return materialAmber;
        break;
    case 15:
        return materialOrange;
        break;
    case 16:
        return materialDeepOrange;
        break;
    case 17:
        return materialBrown;
        break;
    case 18:
        return materialGrey;
        break;
    case 19:
        return materialBlueGrey;
        break;
    default:
        return materialBasic;
        break;
    }
}

/* Get one of the Accent Palettes */
/*
 *
 *
 */
QStringList applicationui::accentPalette(const int paletteIndex)
{
    mAccentPalette = paletteIndex;
    int currentPrimary = mPrimaryPalette;
    QStringList thePalette = primaryPalette(paletteIndex);
    mPrimaryPalette = currentPrimary;
    // we need: primaryColor, textOnPrimary
    return QStringList{thePalette.at(1), thePalette.at(4)};
}



/* Get Default Primary Palette */
/*
 * Zwraca wybrany w opacji kolor
 */
QStringList applicationui::defaultPrimaryPalette()
{
    return primaryPalette(mPrimaryPalette);
}

/* Get Default Accent Palette */
/*
 * Zwraca wybrany w opacj akcent
 */
QStringList applicationui::defaultAccentPalette()
{
    return accentPalette(mAccentPalette);
}
