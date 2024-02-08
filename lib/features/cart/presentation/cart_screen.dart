import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/data/cart_repository.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(getCartProvider);
    print(cart);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Center(
        child: cart.when(
          data: (data) => Text(
            data.items.entries
                .map((e) => '${e.key.name}: ${e.value}')
                .toList()
                .toString(),
          ),
          error: (error, stackTrace) => Text(
            error.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
