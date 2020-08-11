import 'package:flutter/material.dart';
import 'package:testquickflutter/src/models/comment_model.dart';
import 'package:testquickflutter/src/models/post_model.dart';
import 'package:testquickflutter/src/models/user_model.dart';
import 'package:testquickflutter/src/providers/post_provider.dart';
import 'package:testquickflutter/src/widgets/card_widget.dart';

class ComentariosPage extends StatelessWidget {
  final postsProvider = new PostsProvider();
  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("Comentarios del Post ${post.id}"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text("${post.id} - ${post.title}"),
                    subtitle: Text("${post.body}"),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _getUserById(context, post.userId),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Text("Comentarios"),
            ),
            SizedBox(
              height: 20.0,
            ),
            _getComments(context, post.id),
          ],
        ));
  }

  Widget _getUserById(BuildContext context, userId) {
    return FutureBuilder(
      future: postsProvider.getUser(userId),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return Text(
              "${snapshot.data.firstName} ${snapshot.data.lastName} <${snapshot.data.email}>");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _getComments(BuildContext context, postId) {
    return FutureBuilder(
      future: postsProvider.getComments(postId),
      builder: (BuildContext context, AsyncSnapshot<List<Comment>> snapshot) {
        if (snapshot.hasData) {
          return CardWidget(
            posts: snapshot.data,
            isPost: false,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
