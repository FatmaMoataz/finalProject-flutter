import 'package:flutter/cupertino.dart';
import '../add_item/item.dart';

class FavoriteModel extends ChangeNotifier {
  final List<Item> _fav = [];
  List<Item> get fav => _fav;

  void add(Item item) {
    if (!_fav.contains(item)) {
      item.favorite = true;  
      _fav.add(item);
      notifyListeners();
    }
  }

  void remove(Item item) {
    if (_fav.contains(item)) {
      item.favorite = false; 
      _fav.remove(item);
      notifyListeners();
    }
  }

  void isFavorite(Item item) {
    if (item.favorite) {
      remove(item);
    } else {
      add(item);
    }
  }
}
