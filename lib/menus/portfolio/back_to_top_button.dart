import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/menus/portfolio/theme_switcher_button.dart';
import 'package:portfolio/utils/colour_assets.dart';
import 'package:provider/provider.dart';

class BackToTopButton extends StatelessWidget {
  const BackToTopButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = context.watch<ScrollController>();
    if (scrollController.isOffsetZero) return  ThemeSwitcherButton();
    return Container(
      width: context.width(),
      margin: EdgeInsets.only(left: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ThemeSwitcherButton(),
          FloatingActionButton(
            backgroundColor: ColorAsset.redAccent,
            child: Icon(Icons.arrow_upward),
            onPressed: () {
              scrollController.animateTo(
                0,
                duration: Duration(milliseconds: 700),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}

extension on ScrollController {
  bool get isOffsetZero {
    return this.offset == 0;
  }
}
