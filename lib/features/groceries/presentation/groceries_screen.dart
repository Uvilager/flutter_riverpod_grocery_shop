import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/presentation/cart_screen.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/data/groceries_repository.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/add/add_groceries_screen.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/drawer_widget.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/grocery/grocery_screen.dart';

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
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return GroceryScreen(
                    grocery: data[index],
                  );
                },
              ));
            },
            title: Text(data[index].name),
            subtitle: Text(data[index].price),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
            ),
          ),
        ),
        error: (error, stack) => Text(error.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
