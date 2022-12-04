import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/blog/blog_card.dart';
import 'package:portfolio_flutter_web/components/desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/components/mobile_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

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
  static const title = 'Latest Posts';

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Post>>(
        create: (_) => getMyArticles(),
        initialData: [],
        child: MobileDesktopViewBuilder(
            mobileView: ArticleMobileView(),
            desktopView: ArticleDesktopView()));
  }
}

class ArticleMobileView extends StatefulWidget {
  const ArticleMobileView({Key? key}) : super(key: key);

  @override
  State<ArticleMobileView> createState() => _ArticleMobileViewState();
}

class _ArticleMobileViewState extends State<ArticleMobileView> {
  int currentPosition = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    // pageController =
    //     PageController(initialPage: position, viewportFraction: 0.5);
    // position = 0;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    List<Post> articles = context.watch<List<Post>>();

    if (articles.isEmpty) return CircularProgressIndicator();

    return MobileViewBuilder(
      titleText: ArticleContainer.title,
      children: [
        Column(
          children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                width: context.width(),
                height: context.height() * .7,
                child: Container(
                  margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: boxDecorationRoundedWithShadow(
                    8,
                    // backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                  ),
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: pageController,
                      itemCount: articles.length,
                      itemBuilder: (context, index) => Container(
                        child: Column(
                          children: [
                            commonCacheImageWidget(articles[index].featuredMediaUrl, context.height() * .5).cornerRadiusWithClipRRect(16),
                            Text(articles[index].title!, style: boldTextStyle(),
                            maxLines: 2,
                            )
                          ],
                        ),
                    ).onTap((){launch('${articles[index].link}');}),
                      onPageChanged: (int page) {
                        currentPosition = page;
                        print(currentPosition);
                        setState(() {});
                      },
                    ),
                ),
              ),
            8.height,
            DotIndicator(
              pageController: pageController,
              indicatorColor: ColorAsset.HueYellow,
              unselectedIndicatorColor: ColorAsset.HueRed.withOpacity(0.2),
              currentBoxShape: BoxShape.rectangle,
              boxShape: BoxShape.rectangle,
              borderRadius: radius(2),
              currentBorderRadius: radius(3),
              currentDotSize: 18,
              currentDotWidth: 6,
              dotSize: 6,
              pages: articles,
              onDotTap: (value){
                currentPosition = value;
                setState(() {});
              },
            ),
          ],
        )
      ],
    );
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
    if (articles == null) return CircularProgressIndicator();
    return DesktopViewBuilder(titleText: ArticleContainer.title, children: [
      Container(
        // height: context.height(),
        child: GridView.builder(
            itemCount: articles.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.width() <= 1000 ? 1 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: .75,
            ),
            itemBuilder: (_, index) {
              return InkWell(
                mouseCursor: MaterialStateMouseCursor.clickable,
                splashColor: Colors.transparent,
                highlightColor: Colors.yellow.withOpacity(.4),
                hoverColor: Colors.transparent,
                onTap: () => launch('${articles[index].link}'),
                child: Container(
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
                                maxFontSize: 24,
                                minFontSize: 14,
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                    '${convertDate(articles[index].date.toString())} ago',
                                    style: secondaryTextStyle(
                                        color: ColorAsset.SVBodyWhite,
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
                      Text(
                        '${removeAllHtmlTags(articles[index].content!)..split('\n').take(1)}',
                        style: secondaryTextStyle(
                            color: ColorAsset.SVBodyWhite,
                            size: context.width() <= 1000 ? 18 : 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: context.width() < 1000 ? 7 : 4,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              );
            }),
      )
    ]);
  }
}
