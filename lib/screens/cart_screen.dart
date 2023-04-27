import 'package:flutter/material.dart';
import 'package:login/screens/home_screen.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Consumer<Cart>(
        builder: (BuildContext context, Cart cart, Widget? child) {
          return ListView.builder(
            itemCount: cart.products.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(cart.products[index].name),
                subtitle: Text(cart.products[index].description as String),
                trailing: Text(
                    '${cart.products[index].quantity} x ${cart.products[index]
                        .price}'),
              );
            },
          );
        },
      ),
    );
  }
}
