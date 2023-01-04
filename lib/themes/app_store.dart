import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/themes/theme_extension.dart';

import '../utils/colour_assets.dart';
import 'nako_theme_data.dart';



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
    AppTheme.changeMotherTheme(themeType);
  }

  Future<void> updateInStorage(ThemeType themeType) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("nako_theme_mode", themeType.toText);
    sharedPreferences.setString("theme_mode", themeType.toText);
  }

  init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int fxAppThemeMode = sharedPreferences.getInt("nako_theme_mode")??ThemeType.light.index;
    changeAppThemeMode(ThemeType.values[fxAppThemeMode]);

    notifyListeners();
  }

  changeAppThemeMode(ThemeType? value) async {
    AppTheme.defaultThemeType = value!;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setInt("nako_theme_mode", value.index);
    log(AppTheme.getThemeFromThemeMode().toString());
    notifyListeners();
  }
}

