import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_grocery_shop/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/domain/cart_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

class CartRepository {
  CartRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<void> addToCart(Cart cart, String userId) async {
    await _firestore.collection('carts').doc(userId).set(cart.toJson());
  }

  Future<Cart> fetchCart(String userId) async {
    return await _firestore.collection('carts').doc(userId).get().then((value) {
      if (!value.exists) {
        return const Cart();
      }
      return Cart.fromJson(value.data()!);
    });
  }

  Stream<Cart> getCart(String userId) {
    return _firestore.collection('carts').doc(userId).snapshots().map((event) {
      if (!event.exists) {
        return const Cart();
      }
      return Cart.fromJson(event.data()!);
    });
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<Cart> getCart(GetCartRef ref) {
  final userId = ref.read(authStateChangesProvider).value!.uid;
  return ref.watch(cartRepositoryProvider).getCart(userId);
}

@riverpod
Future<Cart> fetchCart(FetchCartRef ref) async {
  final userId = ref.read(authStateChangesProvider).value!.uid;
  return await ref.watch(cartRepositoryProvider).fetchCart(userId);
}
