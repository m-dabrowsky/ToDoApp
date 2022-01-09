#ifndef COLORS_H
#define COLORS_H

#include <QStringList>

/*
 * P R I M A R Y Colors
 *
 *
 * QStringList contains:
 * {primaryLightColor, primaryColor, primaryDarkColor, textOnPrimary}
 * or
 * {secondaryLightColor, secondaryColor, secondaryDarkColor, textOnSecondary}
 *
 */



namespace appColors{
//static const QStringList primaryColor {"#31315B", "#31315C", "#0b222c" "#ffffff"};
//static const QStringList secondaryColor {"#ffdc65", "#f9aa33", "#c17b00" "#000000"};
static const QStringList materialBasic {"#31315B", "#31315B", "#31315B", "#FFFFFF", "#FFFFFF", "#FFFFFF"};
static const QStringList materialRed {"#FFCDD2", "#F44336", "#D32F2F", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialPink {"#F8BBD0", "#E91E63", "#C2185B", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialPurple{"#E1BEE7", "#9C27B0", "#7B1FA2", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialDeepPurple{"#D1C4E9", "#673AB7", "#512DA8", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialIndigo{"#C5CAE9", "#3F51B5", "#303F9F", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialBlue{"#BBDEFB", "#2196F3", "#1976D2", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialLightBlue{"#B3E5FC", "#3D79B1", "#30608D", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialCyan{"#B2EBF2", "#00BCD4", "#0097A7", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialTeal{"#B2DFDB", "#009688", "#00796B", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialGreen{"#C8E6C9", "#4CAF50", "#388E3C", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialLightGreen{"#DCEDC8", "#8BC34A", "#689F38", "#000000", "#000000", "#000000"};
static const QStringList materialLime{"#F0F4C3", "#CDDC39", "#AFB42B", "#000000", "#000000", "#000000"};
static const QStringList materialYellow{"#FFF9C4", "#FFEB3B", "#FBC02D", "#000000", "#000000", "#000000"};
static const QStringList materialAmber{"#FFECB3", "#FFC107", "#FFA000", "#000000", "#000000", "#000000"};
static const QStringList materialOrange{"#FFE0B2", "#FF9800", "#F57C00", "#000000", "#000000", "#000000"};
static const QStringList materialDeepOrange{"#FFCCBC", "#FF5722", "#E64A19", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialBrown{"#D7CCC8", "#795548", "#5D4037", "#000000", "#FFFFFF", "#FFFFFF"};
static const QStringList materialGrey{"#F5F5F5", "#9E9E9E", "#616161", "#000000", "#000000", "#FFFFFF"};
static const QStringList materialBlueGrey{"#CFD8DC", "#607D8B", "#455A64", "#000000", "#FFFFFF", "#FFFFFF"};



/*
 * T H E M E  Light and Dark  ---  Default: Light
 * Colors, Opacity from Google Material Style Guide
 *
 * QStringList contains:
 * {dividerColor, backgroundColor, primaryTextColor, secondaryTextColor, inactiveIconColor, markerColor, rowTaskColor, inputTaskColor, isDark}
 *
 *
*/
static const QStringList darkPalette{"#494949", "#424242", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#FFFFFF", "#5A5A5A", "#292929","1"};
static const QStringList lightPalette{"#000000", "#FFFFFF", "0.32","#87000000", "#54000000", "#000000", "#54000000", "#54000000", "0"};
static const QStringList bluePalette{"#6A6A88", "#31315B", "#FFFFFF", "#6A6A88", "#6A6A88", "#FFFFFF", "#44446B","#282851","0"};



}



#endif // COLORS_H
