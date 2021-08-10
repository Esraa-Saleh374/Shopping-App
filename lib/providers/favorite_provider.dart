import 'package:flutter/material.dart';
import 'package:shopping/models/favorite_atrribute.dart';

class FavoritProvider with ChangeNotifier {
  Map<String, FavoritgAtrr> _favitems = {};

  Map<String, FavoritgAtrr> get getFavoritItem {
    return _favitems;
  }

  void addTofav(String productId, double price, String title, String imageUrl) {
    if (_favitems.containsKey(productId)) {
      removeitem(productId);
    } else {
      _favitems.putIfAbsent(
          productId,
          () => FavoritgAtrr(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                imageUrl: imageUrl,
              ));
    }
    notifyListeners();
  }

  void dislike(String productId, double price, String title, String imageUrl) {
    if (_favitems.containsKey(productId)) {
      _favitems.update(
          productId,
          (value) => FavoritgAtrr(
                id: value.id,
                title: value.title,
                price: value.price,
                imageUrl: value.imageUrl,
              ));
    }
    notifyListeners();
  }

  void removeitem(String productId) {
    _favitems.remove(productId);
    notifyListeners();
  }

  void clearFav() {
    _favitems.clear();
    notifyListeners();
  }
}
