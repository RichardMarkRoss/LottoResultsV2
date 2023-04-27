import 'package:flutter/material.dart';
import 'package:login/lotto_screen.dart';
import 'package:login/models/product.dart';
import 'package:provider/provider.dart';
import 'package:login/home_screen.dart';

class CheckoutPage extends StatelessWidget {
  final List<Product> products = [
  ];

  CheckoutPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const HomeScreens()),
              );
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: ListTile(
                      leading: const Icon(Icons.notification_important),
                      title: const Text('Notification'),
                      onTap: () {},
                    ),
                  ),
                ],
              );
            },
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
        ],
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