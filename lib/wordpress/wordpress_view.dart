import 'dart:convert';
import 'dart:html';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class WordpressView extends StatefulWidget {
  const WordpressView({Key? key}) : super(key: key);

  @override
  _WordpressViewState createState() => _WordpressViewState();
}

class _WordpressViewState extends State<WordpressView> {
  Future<List> getPosts() async {
    var response = await http.get(
      Uri.parse("https://sunaonako.my.id/apps-api/wp/v2/posts?_embed"),
      headers: {
        "Accept": "application/json",
      },
    );

    return jsonDecode(response.body);
  }

  @override
  void initState() {
    getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BelajarFlutterApps',
        ),
      ),
      body: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Map posts = snapshot.data[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          commonCacheImageWidget(
                            posts['_embedded']['wp:featuredmedia'][0]['source_url'],
                            // 'https://cdn.sunaonako.my.id/aruuploads/2022/05/Beginner-SQL-Server.png',
                            250
                          ),
                          Text(
                            posts['title']['rendered'],
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}


/*class MyImage extends StatelessWidget {
  const MyImage({Key? key, required this.s}) : super(key: key);

  final String s;

  @override
  Widget build(BuildContext context) {
    return ui.platformViewRegistry.registerViewFactory(
      s,
      (int _) => ImageElement()..src = s,
    );
  }
}*/
