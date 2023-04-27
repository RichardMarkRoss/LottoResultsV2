import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Cart'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].description as String),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Provider.of<Cart>(context, listen: false).addProduct(products[index]);
              },
            ),
          );
        },
      ),
    );
  }
}

class Cart extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
}