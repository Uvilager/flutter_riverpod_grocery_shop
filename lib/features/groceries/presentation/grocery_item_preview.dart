import 'package:flutter/material.dart';

import 'package:flutter_riverpod_grocery_shop/features/groceries/domain/grocery_model.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/grocery/grocery_screen.dart';

class GroceryItemPreview extends StatelessWidget {
  const GroceryItemPreview({required this.groceries, super.key});

  final List<Grocery> groceries;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: groceries.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return GroceryScreen(
                  grocery: groceries[index],
                );
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF1A3848),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  groceries[index].image,
                  height: 100,
                  width: 100,
                ),
                // Image here
                Text(groceries[index].name),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(groceries[index].price),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(Icons.add),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
