// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Grocery {
  final String name;
  final String price;
  final String category;

  Grocery({
    required this.name,
    required this.price,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'category': category,
    };
  }

  factory Grocery.fromMap(Map<String, dynamic> map) {
    return Grocery(
      name: map['name'] as String,
      price: map['price'] as String,
      category: map['category'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Grocery.fromJson(Map<String, dynamic> source) {
    return Grocery(
      name: source['name'] as String,
      price: source['price'] as String,
      category: source['category'] as String,
    );
  }
}
