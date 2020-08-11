import 'package:flutter/material.dart';
import 'package:testquickflutter/src/models/post_model.dart';
import 'package:testquickflutter/src/models/user_model.dart';
import 'package:testquickflutter/src/providers/post_provider.dart';

class CardWidget extends StatelessWidget {
  final List<dynamic> posts;
  final bool isPost;
  User user;
  final postsProvider = new PostsProvider();

  CardWidget({@required this.posts, @required this.isPost});

  @override
  build(BuildContext context) {
    if (isPost) {
      return Column(
        children: _cardsPosts(context),
      );
    } else {
      return Column(
        children: _cardsComments(context),
      );
    }
  }

  List<Widget> _cardsPosts(BuildContext context) {
    return posts.map((post) {
      return Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${post.id} - ${post.title}"),
              subtitle: Text("${post.body}"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _getUserById(context, post.userId),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'comentarios',
                        arguments: post);
                  },
                  child: Icon(
                    Icons.local_post_office,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList();
  }

  List<Widget> _cardsComments(BuildContext context) {
    return posts.map((post) {
      return Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("${post.id} ${post.name} <${post.email}>"),
              subtitle: Text("${post.body}"),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _getUserById(BuildContext context, userId) {
    return FutureBuilder(
      future: postsProvider.getUser(userId),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return Text("${snapshot.data.firstName} ${snapshot.data.lastName}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
