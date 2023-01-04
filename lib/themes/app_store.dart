import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/services/store_manager.dart';
import 'package:portfolio/themes/theme_extension.dart';

import '../utils/colour_assets.dart';
import 'nako_theme_data.dart';



class NakoThemeNotifier extends ChangeNotifier{
  bool isLightTheme = false;
  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;

  NakoThemeNotifier(){
    init();
  }

  updateTheme(ThemeType themeType) {
    _changeTheme(themeType);

    notifyListeners();

    // updateInStorage(themeType);
  }

  void _changeTheme(ThemeType themeType) {
    AppTheme.themeType = themeType;
    // AppTheme.customTheme = AppTheme.getCustomTheme(themeType);
    AppTheme.theme = AppTheme.getTheme(themeType);
    AppTheme.resetThemeData();
    AppTheme.changeMotherTheme(themeType);
  }

  Future<void> updateInStorage(ThemeType themeType) async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setString("nako_theme_mode", themeType.toText);
    // sharedPreferences.setString("theme_mode", themeType.toText)


    //"light" or "dark"
    await StorageManager.saveData("nako_theme_mode", themeType.toText);
    notifyListeners();
  }

  init() async {
    StorageManager.readData('nako_theme_mode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        AppTheme.theme = AppTheme.getThemeFromThemeMode(themeType: ThemeType.light);
        isLightTheme = true;
      } else {
        print('setting dark theme');
        // AppTheme.themeType = ThemeType.dark;
        AppTheme.theme = AppTheme.getThemeFromThemeMode(themeType: ThemeType.dark);
        isLightTheme = false;
      }
      notifyListeners();
    });
  }

  changeAppThemeMode(ThemeType? value) async {
    AppTheme.defaultThemeType = value!;
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // await sharedPreferences.setInt("nako_theme_mode", value.index);

    await StorageManager.readData("nako_theme_mode");
    log(AppTheme.getThemeFromThemeMode().toString());
    notifyListeners();
  }

  void setDarkMode() async {
    isLightTheme = false;
    AppTheme.changeThemeType(ThemeType.dark);
    await StorageManager.saveData('nako_theme_mode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    isLightTheme = true;
    AppTheme.changeThemeType(ThemeType.light);

    await StorageManager.saveData('nako_theme_mode', 'light');
    notifyListeners();
  }
}

