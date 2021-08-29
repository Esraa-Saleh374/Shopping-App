import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartAttr> _cartitems = {};

  Map<String, CartAttr> get getCartItem {
    return _cartitems;
  }

  double get totalAmmount {
    var total = 0.0;
    _cartitems.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  void addProductToCart(String productId, double price, String title,
      String imageUrl, String offer) {
    if (_cartitems.containsKey(productId)) {
      _cartitems.update(
          productId,
          (value) => CartAttr(
                id: value.id,
                title: value.title,
                price: value.price,
                quantity: value.quantity + 1,
                imageUrl: value.imageUrl,
                offer: offer,
              ));
    } else {
      _cartitems.putIfAbsent(
          productId,
          () => CartAttr(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
                imageUrl: imageUrl,
                offer: offer,
              ));
    }
    notifyListeners();
  }

  void reduceProductToCart(String productId, double price, String title,
      String imageUrl, String offer) {
    if (_cartitems.containsKey(productId)) {
      _cartitems.update(
          productId,
          (value) => CartAttr(
                id: value.id,
                title: value.title,
                price: value.price,
                quantity: value.quantity - 1,
                imageUrl: value.imageUrl,
                offer: value.offer,
              ));
    }
    notifyListeners();
  }

  void removeitem(String productId) {
    _cartitems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartitems.clear();
    notifyListeners();
  }
}
