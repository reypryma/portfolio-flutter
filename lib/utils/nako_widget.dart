import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio/themes/app_store.dart';

AppBar appBar(BuildContext context, String title, {List<Widget>? actions, bool showBack = true, Color? color, Color? iconColor, Color? textColor}) {
  return AppBar(
    automaticallyImplyLeading: false,
    // backgroundColor: color ?? appStore.appBarColor,
    backgroundColor: color ?? Colors.amber,
    leading: showBack
        ? IconButton(
      onPressed: () {
        finish(context);
      },
      icon: Icon(Icons.arrow_back, color: AppTheme.themeType == ThemeType.light ? blueColor : yellowGreen,),
    )
        : null,
    title: appBarTitleWidget(context, title, textColor: textColor, color: color),
    actions: actions,
    elevation: 0.5,
  );
}


Widget appBarTitleWidget(context, String title, {Color? color, Color? textColor}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    color: AppTheme.themeType == ThemeType.light ? blueColor : yellowGreen,
    child: Row(
      children: <Widget>[
        Text(
          title,
          style: boldTextStyle(color:  AppTheme.themeType == ThemeType.light ? darkBlue : whiteSmoke, size: 20),
          maxLines: 1,
        ).expand(),
      ],
    ),
  );
}