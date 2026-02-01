import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map> cartItems = [];

  void addToCart(Map item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromCart(Map item) {
    cartItems.remove(item);
    notifyListeners();
  }
}
