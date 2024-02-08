import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';

class Cart {
  Cart({this.items = const {}});
  Map<Grocery, int> items;

  Cart addGrocery(Grocery grocery, int quantity) {
    final copy = Map<Grocery, int>.from(items);
    copy.update(grocery, (value) => quantity + value, ifAbsent: () => quantity);
    return Cart(items: copy);
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    final List<dynamic> itemsJson = json['items'] ?? [];
    final items = itemsJson.map((item) {
      final groceryJson = item as Map<String, dynamic>;
      final grocery = Grocery.fromJson(groceryJson);
      final quantity = groceryJson['quantity'] as int;
      return MapEntry(grocery, quantity);
    });
    return Cart(items: Map.fromEntries(items));
  }

  Map<String, dynamic> toJson() {
    return {
      'items': items.entries.map((entry) {
        final grocery = entry.key;
        final quantity = entry.value;
        return {
          'name': grocery.name,
          'price': grocery.price,
          'category': grocery.category,
          'quantity': quantity,
        };
      }).toList(),
    };
  }
}
