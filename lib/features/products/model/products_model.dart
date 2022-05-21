class Product {
  int? userId;
  String? id;
  String? title;
  String? body;

  Product({this.userId, this.id, this.title, this.body});

  Product.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Product &&
        o.userId == userId &&
        o.id == id &&
        o.title == title &&
        o.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        body.hashCode;
  }
}