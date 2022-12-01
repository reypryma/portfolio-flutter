import 'dart:convert';

import 'package:flutter/material.dart';
import '../config.dart';
import '../services/wordpress_api.dart';
import 'package:http/http.dart' as http;

final String _baseUrl = urWebsiteUrl;
WordpressClient client = new WordpressClient(_baseUrl, http.Client());

Future<void> getMyArticles() async {

}

class ArticlesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ArticlesViewState();
}

class ArticlesViewState extends State<ArticlesView>
    with TickerProviderStateMixin {
  var scrollCont =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: true,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          child: FutureBuilder<void>(
              future: getMyArticles(),
              builder: (context, snapshot) {
                if (snapshot.hasError) debugPrint(snapshot.error.toString());
                return Container(
                  child: Text(''),
                );
              }),
        ),
      ]),
    );
  }
}


