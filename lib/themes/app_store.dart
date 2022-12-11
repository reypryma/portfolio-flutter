import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';


enum ThemeType{
  light,
  dark,
}

class NakoThemeNotifier extends ChangeNotifier{
  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int fxAppThemeMode = sharedPreferences.getInt("fx_app_theme_mode")??ThemeType.light.index;
    changeAppThemeMode(ThemeType.values[fxAppThemeMode]);

    notifyListeners();
  }

  changeAppThemeMode(ThemeType? value) async {
    AppTheme.defaultThemeType = value!;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("fx_app_theme_mode", value.index);
    log(AppTheme.getThemeFromThemeMode().toString());
    notifyListeners();
  }
}

class AppTheme{
  static ThemeType defaultThemeType = ThemeType.light;

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
        )
    ),
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
        )
    ),
  );


  static void changeThemeType(ThemeType? themeType){
    defaultThemeType = themeType?? ThemeType.light;
    theme = AppTheme.getThemeFromThemeMode();
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


}