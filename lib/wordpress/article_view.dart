import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:portfolio_flutter_web/blog/blog_card.dart';
import 'package:portfolio_flutter_web/components/mobile_desktop_view_builder.dart';
import 'package:portfolio_flutter_web/constants.dart';
import 'package:portfolio_flutter_web/utils/colour_assets.dart';

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
    return FutureBuilder<List<Post>>(
        future: client.listPosts(page: 1, perPage: 4),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return (snapshot.hasData)
              ? MobileDesktopViewBuilder(
                  mobileView: Container(),
                  desktopView: ArticleDesktopView(
                    articles: snapshot.data!,
                  ))
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}

class ArticleDesktopView extends StatefulWidget {
  const ArticleDesktopView({Key? key, required this.articles})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ArticleDesktopViewState();

  final List<Post> articles;
}

class ArticleDesktopViewState extends State<ArticleDesktopView>
    with TickerProviderStateMixin {
  late List<Post> articles;

  var scrollCont =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    articles = widget.articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        resizeToAvoidBottomInset: true,
        body: Container(
          child: GridView.builder(
              itemCount: articles.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
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
                              Text("${(articles[index].author)!.toUpperCase()}", style: boldTextStyle(),),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                              Text('${(articles[index].date)} ago', style: secondaryTextStyle(color: ColourAssets.SVBodyWhite, size: 12)),
                              IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                            ]
                          ),
                        ],
                      ),
                      16.width,
                      Text("${(articles[index].title)!}", style: boldTextStyle(size: 18),),
                      commonCacheImageWidget('${(articles[index].featuredMediaUrl)}', 300, width: 600).cornerRadiusWithClipRRect(5).center(),
                      16.width,
                      Text('${removeAllHtmlTags(articles[index].content!) } ago', style: secondaryTextStyle(color: ColourAssets.SVBodyWhite, size: 12),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      softWrap: true,
                ),
                    ],
                  ),
                );
              }),
        ));
  }

// String? getUserOfAuthor(int userID) {
//   User? authorInfo = client.getUser(userID) as User?;
//   return authorInfo != null ? 'Nakomin' : authorInfo!.name;
// }
}
