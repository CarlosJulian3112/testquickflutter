import 'package:flutter/material.dart';
import 'package:testquickflutter/src/providers/post_provider.dart';
import 'package:testquickflutter/src/widgets/card_widget.dart';

class HomePage extends StatelessWidget {
  final postsProvider = new PostsProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("testquick"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _body(context),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return FutureBuilder(
      future: postsProvider.getPosts(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardWidget(
            posts: snapshot.data,
            isPost: true,
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
