class Posts {
  List<Post> items = new List();

  Posts();

  Posts.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final post = new Post.fromJsonMap(item);
      items.add(post);
    }
  }
}

class Post {
  String id;
  String userId;
  String title;
  String body;

  Post({
    this.id,
    this.userId,
    this.title,
    this.body,
  });
  Post.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    body = json['body'];
  }
}

enum OriginalLanguage { EN, KO }
