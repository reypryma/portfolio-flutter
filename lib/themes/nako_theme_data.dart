import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/colour_assets.dart';

enum ThemeType{
  light,
  dark,
}

class AppTheme{
  static ThemeType defaultThemeType = ThemeType.light;
  // static ThemeType themeType = ThemeType.light;
  static ThemeType themeType = defaultThemeType;

  static ThemeData theme = AppTheme.getThemeFromThemeMode();

  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.black,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 30,
        color: Colors.black,
      ),
      subtitle1: GoogleFonts.antonio(
          color: Colors.white,
          fontSize: 34
      ),
      button: TextStyle(color: appColorPrimary),
      headline6: TextStyle(color: textPrimaryColor),
      subtitle2: TextStyle(color: textSecondaryColor),
    ),
    scaffoldBackgroundColor: whiteColor,
    primaryColor: appColorPrimary,
    primaryColorDark: appColorPrimary,
    errorColor: Colors.red,
    hoverColor: Colors.white54,
    dividerColor: viewLineColor,
    fontFamily: GoogleFonts.openSans().fontFamily,
    appBarTheme: AppBarTheme(
      color: whiteColor,
      iconTheme: IconThemeData(color: textPrimaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
    ),
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: ColorScheme.light(primary: appColorPrimary, primaryVariant: appColorPrimary),
    cardTheme: CardTheme(color: Colors.white),
    cardColor: cardLightColor,
    iconTheme: IconThemeData(color: textPrimaryColor),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: whiteColor),
  );

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      headline2: GoogleFonts.montserrat(
        color: Colors.white60,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 30,
        color: Colors.white60,
      ),
      subtitle1: GoogleFonts.antonio(
          color: Colors.white60,
          fontSize: 34
      ),
      button: TextStyle(color: color_primary_black),
      headline6: TextStyle(color: whiteColor),
      subtitle2: TextStyle(color: Colors.white54),
    ),
    scaffoldBackgroundColor: appBackgroundColorDark,
    highlightColor: appBackgroundColorDark,
    errorColor: Color(0xFFCF6676),
    appBarTheme: AppBarTheme(
      color: appBackgroundColorDark,
      iconTheme: IconThemeData(color: blackColor),
      systemOverlayStyle: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    ),
    primaryColor: color_primary_black,
    dividerColor: Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: color_primary_black,
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
    hoverColor: Colors.black12,
    fontFamily: GoogleFonts.openSans().fontFamily,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: appBackgroundColorDark),
    primaryTextTheme: TextTheme(headline6: primaryTextStyle(color: Colors.white), overline: primaryTextStyle(color: Colors.white)),
    cardTheme: CardTheme(color: cardBackgroundBlackDark),
    cardColor: appSecondaryBackgroundColor,
    iconTheme: IconThemeData(color: whiteColor),
    colorScheme: ColorScheme.dark(primary: appBackgroundColorDark, onPrimary: cardBackgroundBlackDark, primaryVariant: color_primary_black).copyWith(secondary: whiteColor),
  );


  static void changeThemeType(ThemeType? themeType){
    defaultThemeType = themeType?? ThemeType.light;
    theme = AppTheme.getThemeFromThemeMode();
  }

  static void changeMotherTheme(ThemeType themeType) {
    if (themeType == ThemeType.light) {
      AppTheme.changeThemeType(ThemeType.light);
    } else if (themeType == ThemeType.dark) {
      AppTheme.changeThemeType(ThemeType.dark);
    }
  }


  static ThemeData getThemeFromThemeMode({ThemeType? themeType}) {
    if (themeType == null) {
      themeType = defaultThemeType;
    }

    switch (themeType) {
      case ThemeType.light:
        return lightTheme;
      default:
        return darkTheme;
    }
  }

  static void resetThemeData() {
    themeType = (AppTheme.themeType == ThemeType.light ? ThemeType.light : ThemeType.dark);
  }

  static ThemeData getTheme(ThemeType? themeType) {
    themeType = themeType ?? AppTheme.themeType;
    if (themeType == ThemeType.light) return lightTheme;
    return darkTheme;
  }
}