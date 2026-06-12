import 'package:cloths_chance2/model/cartmodel.dart';
import 'package:cloths_chance2/model/productmodel.dart';
import 'package:flutter/material.dart';

class Cartprovider extends ChangeNotifier{
  final Map <String ,Cartmodel> cart = {};
  int get count => cart.length;
  
  void AddtoCart(Productmodel product , int quantity){
    if(cart.containsKey(product.id)){
      cart[product.id]!.qunatity+=quantity;
    }else{
      cart[product.id] = Cartmodel(product: product , qunatity: quantity);
      notifyListeners();
    }
  }
  void IncreaseQuantity(String id){
    cart[id]!.qunatity++;
    notifyListeners();
  }

  void decreaseQuantity(String id){
    if(cart[id]!.qunatity > 1 ){
      cart[id]!.qunatity--;
      notifyListeners();
    }
 
  }
  void ClearCart (){
  cart.clear();
  notifyListeners();
 }
  double subtotal (){
    double sum = 0;
    cart.forEach((Key,Item){
      sum+=Item.product.price*Item.qunatity;
    });
    return sum;
  }
  
}