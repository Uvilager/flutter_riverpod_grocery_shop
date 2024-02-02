import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/controllers/groceries_controller.dart';

class AddGroceriesWidget extends ConsumerWidget {
  const AddGroceriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    late String name;
    late String image;
    late String price;
    late String category;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the name';
                }
                return null;
              },
              onSaved: (value) {
                name = value!;
              },
            ),
            // TextFormField(
            //   decoration: const InputDecoration(labelText: 'Image URL'),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Please enter the image URL';
            //     }
            //     return null;
            //   },
            //   onSaved: (value) {
            //     image = value!;
            //   },
            // ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the price';
                }
                return null;
              },
              onSaved: (value) {
                price = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the category';
                }
                return null;
              },
              onSaved: (value) {
                category = value!;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        ref
                            .read(groceriesControllerProvider.notifier)
                            .addGrocery(
                              name: name,
                              price: price,
                              category: category,
                            );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
