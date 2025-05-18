import 'dart:io';

class User {
  String name;
  String email;
  String bio;
  File? image;

  User({
    required this.name,
    required this.email,
    required this.bio,
    this.image,
  });
}
