import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod_grocery_shop/features/cart/domain/cart_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_repository.g.dart';

class CartRepository {
  CartRepository(this._firestore);
  final FirebaseFirestore _firestore;

  Future<void> addToCart(Cart cart) async {
    print('repository called');
    await _firestore.collection('cart').add(cart.toJson());
  }
}

@riverpod
CartRepository cartRepository(CartRepositoryRef ref) {
  return CartRepository(FirebaseFirestore.instance);
}
