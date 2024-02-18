import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'groceries_repository.g.dart';

class GroceriesRepository {
  GroceriesRepository(this._firestore, this._storage);

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  // TODO Implement GroceriesRepository
  Future<void> addGrocery({
    required String name,
    required String price,
    required String category,
    required File image,
  }) async {
    // Upload image to Firebase Storage
    final imageUrl = await _storage.ref('groceries/$name').putFile(image).then(
          (snapshot) => snapshot.ref.getDownloadURL(),
        );

    // Add grocery to Firebase Firestore
    await _firestore.collection('groceries').add({
      'name': name,
      'price': price,
      'category': category,
      'image': imageUrl,
    });
  }

  Stream<List<Grocery>> getGroceries() {
    return _firestore.collection('groceries').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Grocery.fromJson(doc.data())).toList(),
        );
  }
}

@riverpod
Stream<List<Grocery>> groceries(GroceriesRef ref) {
  return ref.watch(groceriesRepositoryProvider).getGroceries();
}

@Riverpod(keepAlive: true)
GroceriesRepository groceriesRepository(GroceriesRepositoryRef ref) {
  return GroceriesRepository(
      FirebaseFirestore.instance, FirebaseStorage.instance);
}
