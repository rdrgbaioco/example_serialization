

class User {
  String? createdAt;
  String? name;
  String? email;
  String? id;

  User({this.createdAt, this.name, this.email, this.id});

  User.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['name'] = name;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}