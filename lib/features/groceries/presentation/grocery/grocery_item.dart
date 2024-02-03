import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/presentation/controllers/cart_controller.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';

class GroceryWidget extends ConsumerWidget {
  const GroceryWidget({required this.grocery, super.key});
  final Grocery grocery;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(grocery.name),
          ElevatedButton(
            onPressed: () {
              ref.read(cartControllerProvider.notifier).addToCart(grocery);
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
