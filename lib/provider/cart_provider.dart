import 'package:flutter/material.dart';
import 'package:flutter_store_app/model/cart_model.dart';

class CartProvider with ChangeNotifier {
  final List<CartModel> _cartItems = [];
  int _counter = 1;
  double _totalPrice = 0.0;

  List<CartModel> get cartItems => _cartItems;
  int get couter => _counter;
  double get totalPrice => _totalPrice;

  void addCartItem(CartModel item) {
    _cartItems.add(item);
    _totalPrice = _totalPrice + item.price!;
    notifyListeners();
  }

  void removeItem(int index) {
    _totalPrice -= cartItems[index].price! * cartItems[index].quantity!;
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void incrementQuanty(CartModel item) {
    item.quantity = item.quantity! + 1;
    _totalPrice += item.price!;
    notifyListeners();
  }

  void decrementPrice(CartModel item) {
    if (item.quantity != null && item.quantity! > 1) {
      item.quantity = item.quantity! - 1;
      _totalPrice -= item.price!;
      notifyListeners();
    }
  }
}
