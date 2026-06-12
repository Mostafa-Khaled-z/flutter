import 'package:flutter/material.dart';
import 'package:tools/model/tool.dart';

class CartProvider extends ChangeNotifier {
  List<Tool> cart = [];
  addToCart(Tool item) {
    int index = cart.indexWhere((element) => element.name == item.name);
    if (index != -1) {
      item.days++;
    } else {
      cart.add(item);
    }
    notifyListeners();
  }

  removeFromCart(Tool item) {
    cart.remove(item);
    notifyListeners();
  }

  increase(Tool item) {
    item.days++;
    notifyListeners();
  }

  decrease(Tool item) {
    item.days > 1 ? item.days-- : "";
    notifyListeners();
  }

  double calc() {
    double sum = 0;
    for (var tool in cart) {
      sum += tool.price * tool.days;
    }
    return sum;
    // return cart.fold(0, (sum, item) => sum + (item.price * item.days));
  }
}
