import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'item.dart';

class ItemModel extends ChangeNotifier{

List <Item> _items = [];
List<Item> get items => _items;

void addItem(Item item) {
_items.add(item);
notifyListeners();
}


ImagePicker imagePicker = ImagePicker();

List <File> ? selectedImage = [];

Future <void> imageSelector() async {
List <XFile> ? images = await imagePicker.pickMultiImage();

if(images != null ) {
  selectedImage!.addAll(images.map((toElement) => File(toElement!.path)).toList());
}
notifyListeners();
}
void removeImage(index) {
  selectedImage!.removeAt(index);
  notifyListeners();
}
Item ? _selectedItem;
Item ? get selectedItem => _selectedItem;
void selectItem(Item item) {
_selectedItem = item;
notifyListeners();
}
}
