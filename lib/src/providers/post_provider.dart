import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:testquickflutter/src/models/comment_model.dart';

import 'package:testquickflutter/src/models/post_model.dart';
import 'package:testquickflutter/src/models/user_model.dart';

class PostsProvider {
  String _apikey = 'TpTAE5A9uoNAe14GihziDbLwZ0OvWhc18J6g';
  String _url = 'gorest.co.in';

  Future<List<Post>> getPosts() async {
    final url = Uri.https(_url, "public-api/posts", {
      'access-token': _apikey,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final posts = new Posts.fromJsonList(decodedData['result']);

    return posts.items;
  }

  Future<User> getUser(userId) async {
    final url = Uri.https(_url, "public-api/users/$userId", {
      'access-token': _apikey,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final user = new User.fromJsonMap(decodedData['result']);

    return user;
  }

  Future<List<Comment>> getComments(postId) async {
    final url = Uri.https(_url, "public-api/comments", {
      'access-token': _apikey,
      'post_id': postId,
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final comments = new Comments.fromJsonList(decodedData['result']);

    return comments.items;
  }
}
