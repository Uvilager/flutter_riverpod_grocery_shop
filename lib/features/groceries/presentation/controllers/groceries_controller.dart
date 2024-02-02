import 'package:flutter_riverpod_grocery_shop/features/groceries/data/groceries_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'groceries_controller.g.dart';

@riverpod
class GroceriesController extends _$GroceriesController {
  @override
  FutureOr<void> build() {}

  Future<void> addGrocery({
    required String name,
    required String price,
    required String category,
  }) async {
    print('controller called');
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(groceriesRepositoryProvider).addGrocery(
              name: name,
              price: price,
              category: category,
            ));
    print(state);
  }
}
