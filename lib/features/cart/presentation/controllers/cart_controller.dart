import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/domain/cart_model.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/data/cart_repository.dart';

part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  @override
  FutureOr<void> build() {}

  Future<void> addToCart(Grocery grocery) async {
    final cart = Cart();
    final newCart = cart.addGrocery(grocery, 2);
    print(newCart.items);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(cartRepositoryProvider).addToCart(newCart));
  }
}
