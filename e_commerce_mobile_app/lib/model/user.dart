import 'dart:convert';

import 'package:hive/hive.dart';

part 'user.g.dart';

User userFromJson(String str) => User.fromJson(jsonDecode(str));

@HiveType(typeId: 4)
class User {
  @HiveField(0)
  String id;
  @HiveField(1)
  String fullName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? image;
  @HiveField(4)
  DateTime? dateOfBirth;

  User({
    required this.id,
    required this.fullName,
    required this.email,
    this.image,
    this.dateOfBirth,
  });

  factory User.fromJson(Map<String, dynamic> data) => User(
        id: data['id'].toString(),
        fullName: data['fullName'],
        email: data['email'],
        image: data['image'] == null ? null : data['image']['url'],
        dateOfBirth: data['dateOfBirth'] == null
            ? null
            : DateTime.parse(data['dateOfBirth']),
      );
}
