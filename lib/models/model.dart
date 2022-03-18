import 'dart:convert';

class UserModel {
  late int id;
  late String name;
  late String email;
  late String username;
  late String password;
  late String profilePhotoUrl;
  late String token;

  UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.profilePhotoUrl,
      required this.username,
      required this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    profilePhotoUrl = json['profilePhotoUrl'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'password': password,
      'profilePhotoUrl': profilePhotoUrl,
      'token': token
    };
  }
}
