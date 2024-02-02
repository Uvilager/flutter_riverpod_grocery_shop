import 'package:flutter/material.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/grocery/grocery_item.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery Screen'),
        ),
        body: const GroceryWidget());
  }
}
