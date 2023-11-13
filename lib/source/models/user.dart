

class User {
  User({
    this.id = '',
    this.createdAt = '',
    this.name = '',
    this.email = '', 
  });

  final String id;
  final String createdAt;
  final String name;
  final String email;


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'email': email,
    };
  }
}