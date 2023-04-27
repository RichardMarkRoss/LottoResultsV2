import 'dart:ffi';

class Product {
  final String name;
  final Array description;
  final double price;
  int quantity;

  Product({required this.name, required this.description, required this.price, this.quantity = 0});
}