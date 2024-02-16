import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_grocery_shop/features/cart/presentation/cart_screen.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/data/groceries_repository.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/add/add_groceries_screen.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/drawer_widget.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/grocery_item_preview.dart';

class GroceriesScreen extends ConsumerWidget {
  const GroceriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceries = ref.watch(groceriesProvider);

    return Scaffold(
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddGroceriesScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Groceries'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: groceries.when(
        data: (data) {
          if (data.isEmpty) {
            return const Center(
              child: Text('No Groceries, Please add some'),
            );
          } else {
            return GroceryItemPreview(groceries: data);
          }
        },
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
