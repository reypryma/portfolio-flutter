import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../models/category.dart';
import '../models/media.dart';
import '../models/post.dart';
import '../models/users.dart';

typedef void APIErrorHandler(String endpoint, int statusCode, String response);

class WordpressClient {
  final Logger _logger = new Logger('API');
  String _baseURL;
  Client _client;
  APIErrorHandler? _errorHandler;

  WordpressClient(this._baseURL, this._client, [this._errorHandler]);

  /// Get all available categories.
  ///
  /// If [hideEmpty] is false then ALL categories will be returned, and
  /// [excludeIDs] can be used to ignore specific category IDs
  Future<List<Category>> listCategories(
      {bool hideEmpty: true, List<int>? excludeIDs}) async {
    String _endpoint = '/wp/v2/categories';

    // Build query string
    String queryString = '';
    if (hideEmpty) {
      queryString = _addParamToQueryString(queryString, 'hide_empty', 'true');
    }
    if (excludeIDs != null && excludeIDs.length > 0) {
      queryString =
          _addParamToQueryString(queryString, 'exclude', excludeIDs.join(','));
    }

    // Append the query string
    _endpoint += queryString;

    // Retrieve the data
    List<Map> categoryMaps = await (_get(_endpoint));

    List<Category> categories = [];
    categories = categoryMaps
        .map((categoryMap) =>
        Category.fromMap(categoryMap as Map<String, dynamic>))
        .toList();

    return categories;
  }

  /// Get all available posts.
  ///
  /// If [categoryIDs] list is provided then only posts within those categories
  /// will be returned. Use [injectObjects] to have full objects injected
  /// rather than just the object ID (i.e. a posts's featured media). The [page]
  /// and [perPage] parameters allow for pagination.
  Future<List<Post>> listPosts(
      {List<int>? categoryIDs,
        bool injectObjects: false,
        List<int>? excludeIDs,
        int page: 1,
        int perPage: 10}) async {
    String _endpoint = '/wp/v2/posts?_embed';
    print(_endpoint);

    // Build query string starting with pagination
    String queryString = '&per_page=$perPage';
    queryString = _addParamToQueryString(queryString, 'page', page.toString());

    // If category IDs were sent, limit to those
    if (categoryIDs != null && categoryIDs.length > 0) {
      queryString = _addParamToQueryString(
          queryString, 'categories', categoryIDs.join(','));
    }

    // Exclude posts?
    if (excludeIDs != null && excludeIDs.length > 0) {
      queryString =
          _addParamToQueryString(queryString, 'exclude', excludeIDs.join(','));
    }

    // Append the query string
    _endpoint += queryString;
    //_endpoint =
    // Retrieve the data
    List<Map>? postMaps = await (_get(_endpoint));
    print(_endpoint);

    List<Post>? posts = [];
    posts = postMaps!
        .map((postMap) => new Post.fromMap(postMap as Map<String, dynamic>))
        .toList();
    //print(posts.toString()) ;
    // Inject objects if requested
//    if (injectObjects) {
//      for (Post p in posts) {
//        if (p.featuredMediaID != null && p.featuredMediaID > 0) {
//          p.featuredMedia = await getMedia(p.featuredMediaID);
//        }5
//      }
//    }

    return posts;
  }

  /// Get all available media.
  ///
  /// If [mediaIDs] list is provided then only these specific media items
  /// will be returned. The [page] and [perPage] parameters allow for pagination.
  Future<List<Media>> listMedia(
      {List<int>? includeIDs, int page: 1, perPage: 10}) async {
    String _endpoint = '/wp/v2/media';

    // Build query string starting with pagination
    String queryString = '';
    queryString = _addParamToQueryString(queryString, 'page', page.toString());
    queryString =
        _addParamToQueryString(queryString, 'per_page', perPage.toString());

    // Requesting specific items
    if (includeIDs != null && includeIDs.length > 0) {
      queryString =
          _addParamToQueryString(queryString, 'include', includeIDs.join(','));
    }

    // Append the query string
    _endpoint += queryString;

    // Retrieve the data
    List<Map> mediaMaps = await (_get(_endpoint));

    List<Media> media = [];
    media = mediaMaps
        .map((mediaMap) => new Media.fromMap(mediaMap as Map<String, dynamic>))
        .toList();

    return media;
  }

  //****** */
  /// Get all available user.
  ///
  /// If [userIDs] list is provided then only these specific user items
  /// will be returned. The [page] and [perPage] parameters allow for pagination.
  /* Future<List<User>> listUser() async {
    String _endpoint = '/wp/v2/users';

    List<Map> userMaps = await _get(_endpoint);

    List<User> user = new List();
    user = userMaps.map((userMap) => new User.fromMap(userMap)).toList();

    return user;
  }
  */
  Future<List<User>> listUser(
      {List<int>? includeIDs, int page: 1, int perPage: 10}) async {
    String _endpoint = '/wp/v2/users';

    // // Build query string starting with pagination
    // String queryString = '';
    // queryString = _addParamToQueryString(queryString, 'page', page.toString());
    // queryString =
    //     _addParamToQueryString(queryString, 'per_page', perPage.toString());

    // // Requesting specific items
    // if (includeIDs != null && includeIDs.length > 0) {
    //   queryString =
    //       _addParamToQueryString(queryString, 'include', includeIDs.join(','));
    // }

    // Append the query string
    // _endpoint += queryString;

    // Retrieve the data
    List<Map> userMaps = await (_get(_endpoint).then((onValue) {
      debugPrint('the userMpas' + onValue.toString());
    }).catchError((e) => debugPrint(e))
    as FutureOr<List<Map<dynamic, dynamic>>>);

    var users = [];

    for (int i = 0; i < userMaps.length; i++) {
      users.add(User.fromMap(userMaps[i]));
    }

    return users as FutureOr<List<User>>;
  }

  /// Get post
  Future<Post?> getPost(int? postID, {bool injectObjects: true}) async {
    if (postID == null) {
      return null;
    }

    String _endpoint = '/wp/v2/posts/$postID?_embed';

    // Retrieve the data
    Map? postMap = await (_get(_endpoint) as FutureOr<Map<dynamic, dynamic>?>);
    if (postMap == null) {
      return null;
    }

    Post p = new Post.fromMap(postMap as Map<String, dynamic>);

    // Inject objects if requested
//    if (injectObjects) {
//      if (p.featuredMediaID != null && p.featuredMediaID > 0) {
//        p.featuredMedia = await getMedia(p.featuredMediaID);
//      }
//    }

    return p;
  }

  /// Get media item
  Future<Media?> getMedia(int? mediaID) async {
    if (mediaID == null) {
      return null;
    }

    String _endpoint = '/wp/v2/media/$mediaID';

    // Retrieve the data
    Map? mediaMap = await (_get(_endpoint) as FutureOr<Map<dynamic, dynamic>?>);
    if (mediaMap == null) {
      return null;
    }

    return new Media.fromMap(mediaMap as Map<String, dynamic>);
  }

  /// Get media item
  Future<Media?> getAttMedia(int? mediaID) async {
    if (mediaID == null) {
      return null;
    }

    String _endpoint = '/wp/v2/media/$mediaID';

    // Retrieve the data
    Map? mediaMap = await (_get(_endpoint) as FutureOr<Map<dynamic, dynamic>?>);
    if (mediaMap == null) {
      return null;
    }

    return new Media.fromMap(mediaMap as Map<String, dynamic>);
  }

  /// Get User item
  Future<User?> getUser(int? userID) async {
    if (userID == null) {
      return null;
    }

    String _endpoint = '/wp/v2/users/$userID';

    // Retrieve the user data
    Map? userMap = await (_get(_endpoint) as FutureOr<Map<dynamic, dynamic>?>);
    if (userMap == null) {
      return null;
    }

    return new User.fromMap(userMap);
  }

  _handleError(String endpoint, int statusCode, String response) {
    // If an error handler has been provided use that, otherwise log
    if (_errorHandler != null) {
      debugPrint(statusCode.toString());
      _errorHandler!(endpoint, statusCode, response);
      return;
    }

    _logger.log(
        Level.SEVERE, "Received $statusCode from '$endpoint' => $response");
  }

  Future _get(String url) async {
    dynamic jsonObj;
    String endpoint = '$_baseURL$url';
    print("END POINT is " + endpoint);
    try {
      Response response = await _client
          .get(Uri.parse(endpoint), headers: {"Accept": "application/json"});

      // Error handling
      if (response.statusCode != 200) {
        _handleError(url, response.statusCode, response.body);
        print("status code != 200");
        return null;
      }
      jsonObj = json.decode(response.body);
    } catch (e) {
      _logger.log(Level.SEVERE, 'Error in GET call to $endpoint', e);
    }

    if (jsonObj is List) {
      // This is needed for Dart 2 type constraints
      return jsonObj.map((item) => item as Map).toList();
    }

    return jsonObj;
  }

  String _addParamToQueryString(String? queryString, String key, String value) {
    if (queryString == null) {
      queryString = '';
    }

    if (queryString.length == 0) {
      queryString += '?';
    } else {
      queryString += '&';
    }

    queryString += '$key=$value';

    return queryString;
  }
}
