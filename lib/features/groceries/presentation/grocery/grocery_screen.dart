import 'package:flutter/material.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/grocery/grocery_item.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({required this.grocery, super.key});
  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grocery Screen'),
        ),
        body: GroceryWidget(grocery: grocery));
  }
}
