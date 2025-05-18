import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../profile/user.dart';

class UserModel extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  final ImagePicker imagePicker = ImagePicker();

  UserModel() {
    _user = User(
      name: '',
      bio: 'code eat sleep repeat',
      image: null,
      email: '',
    );
  }

  void updateBio(String bio) {
    if (_user == null) {
      _user = User(
        name: '',
        bio: bio,
        image: null,
        email: '',
      );
    } else {
      _user = User(
        name: _user!.name,
        bio: bio,
        image: _user!.image,
        email: _user!.email,
      );
    }
    notifyListeners();
  }

  Future<void> imageSelector(ImageSource source) async {
    final XFile? selectedImage = await imagePicker.pickImage(source: source);
    if (selectedImage != null) {
      final imageFile = File(selectedImage.path);
      if (_user == null) {
        _user = User(
          name: '',
          bio: 'code eat sleep repeat',
          image: imageFile,
          email: '',
        );
      } else {
        _user = User(
          name: _user!.name,
          bio: _user!.bio,
          image: imageFile,
          email: _user!.email,
        );
      }
      notifyListeners();
    }
  }

  void removeImage() {
    if (_user != null) {
      _user = User(
        name: _user!.name,
        bio: _user!.bio,
        image: null,
        email: _user!.email,
      );
      notifyListeners();
    }
  }
}

