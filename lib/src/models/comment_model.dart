class Comments {
  List<Comment> items = new List();

  Comments();

  Comments.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final comment = new Comment.fromJsonMap(item);
      items.add(comment);
    }
  }
}

class Comment {
  String id;
  String postId;
  String name;
  String email;
  String body;

  Comment({
    this.id,
    this.postId,
    this.name,
    this.email,
    this.body,
  });
  Comment.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['postId'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }
}