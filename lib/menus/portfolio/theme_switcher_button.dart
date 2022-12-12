import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/themes/app_store.dart';
import 'package:provider/provider.dart';

class ThemeSwitcherButton extends StatefulWidget {
  const ThemeSwitcherButton({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcherButton> createState() => _ThemeSwitcherButtonState();
}

class _ThemeSwitcherButtonState extends State<ThemeSwitcherButton> {

  @override
  Widget build(BuildContext context) {
    final themeData = context.watch<NakoThemeNotifier>();

    return FloatingActionButton.extended(
        label: Text(
          "Theme",
          style: primaryTextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.wb_sunny_sharp,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            if(AppTheme.getThemeFromThemeMode() == ThemeType.light){
              themeData.changeAppThemeMode(ThemeType.dark);
            }else{
              themeData.changeAppThemeMode(ThemeType.light);
            }
          });
          // themeData.changeAppThemeMode(value)
        });
  }
}
