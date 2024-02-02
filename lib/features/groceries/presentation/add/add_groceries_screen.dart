import 'package:flutter/material.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/add/add_groceries_widget.dart';

class AddGroceriesScreen extends StatelessWidget {
  const AddGroceriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Groceries'),
        ),
        body: const AddGroceriesWidget());
  }
}
