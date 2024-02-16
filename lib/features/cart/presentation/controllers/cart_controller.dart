import 'package:flutter_riverpod_grocery_shop/features/auth/data/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/data/cart_repository.dart';

part 'cart_controller.g.dart';

@riverpod
class CartController extends _$CartController {
  @override
  FutureOr<void> build() {}

  Future<void> addToCart(Grocery grocery, int quantity) async {
    final userId = ref.read(authStateChangesProvider).value!.uid;
    final cart = await ref.watch(fetchCartProvider.future);
    final newCart = cart.addGrocery(grocery, quantity);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(cartRepositoryProvider).addToCart(newCart, userId));
  }

  Future<void> removeFromCart(Grocery grocery) async {
    final userId = ref.read(authStateChangesProvider).value!.uid;
    final cart = await ref.watch(fetchCartProvider.future);
    final newCart = cart.removeGrocery(grocery);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(cartRepositoryProvider).addToCart(newCart, userId));
  }
}

@riverpod
class AddToCartQuantityController extends _$AddToCartQuantityController {
  @override
  int build() {
    return 1;
  }

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 1) {
      state = state - 1;
    }
  }
}
