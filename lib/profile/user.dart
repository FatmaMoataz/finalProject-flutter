import 'dart:io';

class User {
  String name;
  String bio;
  File ? image;

  User({ required this.name, required this.bio, required this.image});

}