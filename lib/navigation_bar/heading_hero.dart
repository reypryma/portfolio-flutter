import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/colour_assets.dart';


class FlutterCodeText extends StatelessWidget {
  const FlutterCodeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        text: "<",
        style: TextStyle(
            color: ColorAsset.HueRed
        ),
        children: [
          TextSpan(
            text: "flutter",
            style: Theme.of(context).textTheme.headline3,
          ),
          TextSpan(text: ">", style: TextStyle(
              color: ColorAsset.HueRed
          )),
        ],
      ),
      minFontSize: 5,
    );
  }
}
