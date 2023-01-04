import 'package:flutter/material.dart';
import 'package:portfolio/menus/portfolio/portfolio_view.dart';
import 'package:portfolio/themes/app_store.dart';
import 'package:portfolio/themes/nako_theme_data.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  runApp(ChangeNotifierProvider<NakoThemeNotifier>(
      create: (context) => NakoThemeNotifier(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<NakoThemeNotifier>(
      builder: (BuildContext context, NakoThemeNotifier v, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'RePryMa Flutter',
          theme: AppTheme.theme,
          home: PortfolioView(),
        );
      },
    );
  }
}
