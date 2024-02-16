import 'package:flutter/material.dart';

class Toy {
  final String name;
  final String price;
  final String imagePath;
  final String description;

  Toy({
    required this.name,
    required this.price,
    required this.description,
    required this.imagePath,
  });
}

class Cart extends ChangeNotifier {
  //list of Toy for sale
  List<Toy> toyShop = [
    Toy(
      name: 'Iron Man',
      price: '2.000.000',
      description: 'Iron Man kelazz mannnn',
      imagePath: 'lib/images/ironman.jpeg',
    ),
    Toy(
      name: 'Joker',
      price: '3.500.000',
      description: 'Tertawalah sebelum ditertawakan',
      imagePath: 'lib/images/joker.jpg',
    ),
    Toy(
      name: 'Thor',
      price: '2.450.000',
      description: 'Sodaranya loki',
      imagePath: 'lib/images/thor.jpg',
    ),
    Toy(
      name: 'AntMan',
      price: '2.700.000',
      description: 'hati-hati masuk lubang',
      imagePath: 'lib/images/antman.jpg',
    ),
  ];

  //list of items in user cart
  List<Toy> userCart = [];

  //get list of Toy for sale
  List<Toy> getToyList() {
    return toyShop;
  }

  //get cart
  List<Toy> getUserCart() {
    return userCart;
  }

  //add items to cart
  void addItemToCart(Toy toy) {
    userCart.add(toy);
    notifyListeners();
  }

  //remove items from cart
  void removeItemsFromCart(Toy toy) {
    userCart.remove(toy);
    notifyListeners();
  }
}
