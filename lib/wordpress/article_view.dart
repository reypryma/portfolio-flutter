import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/blog/blog_card.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../config.dart';
import '../models/post.dart';
import '../services/wordpress_api.dart';

final String _baseUrl = mainApiUrl;
WordpressClient client = new WordpressClient(_baseUrl, http.Client());

Future<List<Post>> getMyArticles() async {
  var fetchArticles = await client.listPosts(page: 1, perPage: 4);
  List<Post> posts = fetchArticles;
  return posts;
}

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Post>>(
        create: (_) => getMyArticles(),
        initialData: [],
        child: MobileDesktopViewBuilder(
            mobileView: Container(), desktopView: ArticleDesktopView()));
  }
}

class ArticleDesktopView extends StatefulWidget {
  const ArticleDesktopView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleDesktopViewState();
}

class ArticleDesktopViewState extends State<ArticleDesktopView>
    with TickerProviderStateMixin {
  SizingInformation? _sizingInformation;

  // late List<Post> articles;

  var scrollCont =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // articles = widget.articles;
  }

  @override
  Widget build(BuildContext context) {
    final articles = context.watch<List<Post>>();
    if(articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(titleText: "Latest Article", children: [
      Container(
        height: context.height(),
        child: GridView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width() <= 1000 ? 1 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(radiusCircular(5)),
                    border: Border.all(
                        color: Color(0x00fffab201),
                        width: 2,
                        strokeAlign: StrokeAlign.inside),
                    color: context.cardColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              child: commonCacheImageWidget(
                                authorImage,
                                55,
                                fit: BoxFit.cover,
                              ).cornerRadiusWithClipRRect(50),
                            ),
                            12.width,
                            AutoSizeText(
                              "${(articles[index].author)!.toUpperCase()}",
                              style: boldTextStyle(),
                              minFontSize: 11,
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('${(articles[index].date)} ago',
                                  style: secondaryTextStyle(
                                      color: ColourAssets.SVBodyWhite,
                                      size: 12)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_horiz)),
                            ]),
                      ],
                    ),
                    16.height,
                    Text(
                      "${(articles[index].title)!}",
                      style: boldTextStyle(size: 18),
                    ),
                    16.height,
                    commonCacheImageWidget(
                            '${(articles[index].featuredMediaUrl)}', 300,
                            width: 600)
                        .cornerRadiusWithClipRRect(5)
                        .center(),
                    32.height,
                    AutoSizeText(
                      '${removeAllHtmlTags(articles[index].content!)..split('\n').take(1)}',
                      style: secondaryTextStyle(
                          color: ColourAssets.SVBodyWhite, size: 18),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                      minFontSize: 8,
                    ),
                  ],
                ),
              );
            }),
      )
    ]);
  }

// String? getUserOfAuthor(int userID) {
//   User? authorInfo = client.getUser(userID) as User?;
//   return authorInfo != null ? 'Nakomin' : authorInfo!.name;
// }
}
