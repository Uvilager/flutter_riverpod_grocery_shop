import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'groceries_repository.g.dart';

class GroceriesRepository {
  GroceriesRepository(this._firestore);

  final FirebaseFirestore _firestore;

  // TODO Implement GroceriesRepository
  Future<void> addGrocery({
    required String name,
    required String price,
    required String category,
  }) async {
    print('repository called');

    await _firestore.collection('groceries').add({
      'name': name,
      'price': price,
      'category': category,
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
  return GroceriesRepository(FirebaseFirestore.instance);
}
