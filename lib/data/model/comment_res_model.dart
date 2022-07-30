class CommentResponseModel {
  String? name;
  String? email;
  String? body;
  String? postId;
  int? id;

  CommentResponseModel(
      {this.name, this.email, this.body, this.postId, this.id});

  CommentResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    body = json['body'];
    postId = json['postId'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['body'] = this.body;
    data['postId'] = this.postId;
    data['id'] = this.id;
    return data;
  }
}
