import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_grocery_shop/features/cart/data/cart_repository.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/presentation/controllers/cart_controller.dart';
import 'package:flutter_riverpod_grocery_shop/features/checkout/presentation/checkout_screen.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(getCartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cart.when(
              data: (data) {
                if (data.items.isEmpty) {
                  return const Text('Cart is empty, add some items');
                }
                return ListView.builder(
                  itemCount: data.items.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  child: Row(
                                children: [
                                  Image.network(
                                    data.items.keys.toList()[index].image,
                                    height: 75,
                                    width: 75,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                          data.items.keys.toList()[index].name),
                                      Text(data.items.keys
                                              .toList()[index]
                                              .price +
                                          '€'),
                                    ],
                                  ),
                                ],
                              )),
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                    ),
                                    child: const Icon(Icons.remove),
                                    onPressed: () {
                                      if (data.items.values.toList()[index] ==
                                          1) {
                                        ref
                                            .read(
                                                cartControllerProvider.notifier)
                                            .removeFromCart(
                                              data.items.keys.toList()[index],
                                            );
                                      } else {
                                        ref
                                            .read(
                                                cartControllerProvider.notifier)
                                            .addToCart(
                                                data.items.keys.toList()[index],
                                                -1);
                                      }
                                    },
                                  ),
                                  Text(data.items.values
                                      .toList()[index]
                                      .toString()),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                    ),
                                    child: const Icon(Icons.add),
                                    onPressed: () {
                                      ref
                                          .read(cartControllerProvider.notifier)
                                          .addToCart(
                                              data.items.keys.toList()[index],
                                              1);
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
              },
              error: (error, stackTrace) => Text(
                error.toString(),
              ),
              loading: () => const CircularProgressIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
                child: const Text('Checkout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
