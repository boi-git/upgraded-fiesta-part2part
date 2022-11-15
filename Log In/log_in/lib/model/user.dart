import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String name;
  final String role;

  User({
    required this.name,
    required this.role,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'role': role,
      };
  static User fromJson(Map<String, dynamic> json) => User(
        name: json['username'],
        role: json['role'],
      );
}
