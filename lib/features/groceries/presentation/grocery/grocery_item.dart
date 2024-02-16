import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/presentation/controllers/cart_controller.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';

class GroceryWidget extends ConsumerWidget {
  const GroceryWidget({required this.grocery, super.key});
  final Grocery grocery;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(addToCartQuantityControllerProvider);
    ref.listen(
      cartControllerProvider,
      (previous, next) {
        ScaffoldMessenger.of(context).clearSnackBars();
        if (next.hasError == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Item added to Cart.'),
            ),
          );
        }
      },
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(grocery.name),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  ref
                      .read(addToCartQuantityControllerProvider.notifier)
                      .decrement();
                },
              ),
              Text(quantity.toString()),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  ref
                      .read(addToCartQuantityControllerProvider.notifier)
                      .increment();
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              ref
                  .read(cartControllerProvider.notifier)
                  .addToCart(grocery, quantity);
            },
            child: const Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}
