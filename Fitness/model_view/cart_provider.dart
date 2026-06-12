import 'package:fitness/model/gym_class.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<GymClass> cart = [];
  addToCart(GymClass item) {
    if (!item.isBooked) {
      cart.add(item);
      item.isBooked = true;
    }
    notifyListeners();
  }

  removeFromCart(GymClass item) {
    cart.remove(item);
    item.isBooked = false;
    notifyListeners();
  }

  double calc() {
    return cart.fold(0, (sum, item) => sum + item.price);
  }
  
}
