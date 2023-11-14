// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AutModel authFromJson(String str) => AutModel.fromJson(json.decode(str));

String authToJson(AutModel data) => json.encode(data.toJson());

class AutModel {
  bool status;
  String message;
  User user;

  AutModel({
    required this.status,
    required this.message,
    required this.user,
  });

  factory AutModel.fromJson(Map<String, dynamic> json) => AutModel(
        status: json["status"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}

class User {
  String username;
  String password;
  int id;

  User({
    required this.username,
    required this.password,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        password: json["password"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "id": id,
      };
}
