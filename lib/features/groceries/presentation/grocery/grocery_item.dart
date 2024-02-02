import 'package:flutter/material.dart';

class GroceryWidget extends StatelessWidget {
  const GroceryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Add to Cart'),
      ),
    );
  }
}
