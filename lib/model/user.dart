import 'dart:ffi';

class User {
  final int id;
  final String username;
  final String email;
  final bool active;
  final int lastSeen;
  final String image;
  final String? uuid;
  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.active,
      required this.image,
      required this.lastSeen,
      required this.uuid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        active: json['active'],
        lastSeen: json['lastSeen'],
        uuid: json['uuid'],
        image: json["image"]);
  }
}
