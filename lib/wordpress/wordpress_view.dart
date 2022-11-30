import 'package:flutter/material.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/wordpress/wordpress_card.dart';
import 'package:provider/provider.dart';
import 'package:wordpress_client/responses.dart';

import '../blog/blog_card.dart';
import '../services/blog_services.dart';

class WordpressView extends StatelessWidget {
  const WordpressView({Key? key}) : super(key: key);
  static const title = 'Newest Post';

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
        create: (_) => getFutureWordpressBlog(),
    initialData: [],
    child: MobileDesktopViewBuilder(mobileView: WordpressMobileView(), desktopView: WordpressDesktopView()));
  }
}

class WordpressDesktopView extends StatelessWidget {
  const WordpressDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<Post>?>();
    if (articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(titleText: WordpressView.title, children: [
      Row(
        children: [
          for(final article in articles!)
            Container(

            )
        ],
      ),
      SizedBox(height: 100),
    ],);
  }
}


class WordpressMobileView extends StatelessWidget {
  const WordpressMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


