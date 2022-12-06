import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/menus/portfolio/portfolio_view.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorAsset.HueDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Repryma",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 24),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: 3.seconds,
              onEnd: (){Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PortfolioView(),
                ),
              );},
              builder: (context, double value, child) {
                return Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                        backgroundColor: ColorAsset.HueYellow,
                        value: value,
                        color: ColorAsset.HueRed,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text((value * 100).toInt().toString() + "%", style: boldTextStyle(color: ColorAsset.HueWhite),),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
