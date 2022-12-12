import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';


enum ThemeType{
  light,
  dark,
}

class NakoThemeNotifier extends ChangeNotifier{

  NakoThemeNotifier(){
    init();
  }

  updateTheme(ThemeType themeType) {
    _changeTheme(themeType);

    notifyListeners();

    updateInStorage(themeType);
  }

  void _changeTheme(ThemeType themeType) {
    AppTheme.themeType = themeType;
    // AppTheme.customTheme = AppTheme.getCustomTheme(themeType);
    AppTheme.theme = AppTheme.getTheme(themeType);
    AppTheme.resetThemeData();
    AppTheme.changeFxTheme(themeType);
  }

  Future<void> updateInStorage(ThemeType themeType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("fx_app_theme_mode", themeType.toText);
    sharedPreferences.setString("theme_mode", themeType.toText);
  }

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

  static void changeFxTheme(ThemeType themeType) {
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

extension ThemeExtension on ThemeType {
  String get toText {
    return this == ThemeType.light ? "light" : "dark";
  }
}

extension StringExtension on String {
  ThemeType get toThemeType {
    return this == "dark" ? ThemeType.dark : ThemeType.light;
  }
}
