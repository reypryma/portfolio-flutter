import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';

Future<List<http.Response>> getPosts() async {
  var response = await http.get(
    Uri.parse("${apiUrl}posts?_embed"),
    headers: {
      "Accept": "application/json",
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }  else{
    throw 'error';
  }
}

class BlogService {

}


class BlogProvider extends ChangeNotifier {
  // final _service = BlogService();
  // bool isLoading = false;
  // List<Post> _todos = [];
  // List<Post> get todos => _todos;
  //
  // Future<void> getAllBlogs() async {
  //   isLoading = true;
  //   notifyListeners();
  //
  //   final response = await _service.getAll();
  //
  //   _todos = response.data!.toList();
  //
  //   isLoading = false;
  //   notifyListeners();
  // }
}

// Future<List<Post>?> getFutureWordpressBlog() async {
//
//   final _service = BlogService();
//   final response = await _service.getAll();
//
//   List<Post> _getWordpressPost = response.data!.toList();
//   return _getWordpressPost;
//
// }

/*
Future<List<RssItem>?> getArticles() async {
  var url =
      'https://cors-anywhere.herokuapp.com/https://medium.com/feed/@nakotech';

  // final response = await http.get(url);
  var response = await http.get(Uri.parse(url));
  final parsedResponse = RssFeed.parse(response.body);
  final haveFlutterTag = (RssItem article) {
    return article.categories!.any((category) => category.value == 'flutter');
  };
  final flutterArticles =
  parsedResponse.items?.where(haveFlutterTag).take(2).toList();

  return flutterArticles;
}*/
