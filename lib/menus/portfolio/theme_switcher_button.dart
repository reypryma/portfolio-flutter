import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/themes/app_store.dart';
import 'package:portfolio/themes/nako_theme_data.dart';
import 'package:provider/provider.dart';

class ThemeSwitcherButton extends StatefulWidget {
  const ThemeSwitcherButton({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcherButton> createState() => _ThemeSwitcherButtonState();
}

class _ThemeSwitcherButtonState extends State<ThemeSwitcherButton> {
  late ThemeData theme;

  bool isDark = false;

  void changeTheme() {
    if (AppTheme.themeType == ThemeType.light) {
      Provider.of<NakoThemeNotifier>(context, listen: false)
          .updateTheme(ThemeType.dark);
    } else {
      Provider.of<NakoThemeNotifier>(context, listen: false)
          .updateTheme(ThemeType.light);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final themeData = context.watch<NakoThemeNotifier>();
    isDark = AppTheme.themeType == ThemeType.dark;
    theme = AppTheme.theme;

    return Consumer<NakoThemeNotifier>(
      builder: (BuildContext context, NakoThemeNotifier value, Widget? child) {
        return FloatingActionButton.extended(
            label: Text(
              isDark ? "Dark" : "Light",
              style: primaryTextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
            icon: Icon(
              !isDark ? Icons.wb_sunny_sharp : Icons.mode_night,
              color: Colors.white,
            ),
            onPressed: () {
                changeTheme();
              // themeData.changeAppThemeMode(value)
            }
            );
      }
    );
  }
}
