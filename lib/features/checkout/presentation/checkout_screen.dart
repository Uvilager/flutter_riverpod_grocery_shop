import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(16),
        child: CardField(
          onCardChanged: (card) {
            print(card);
          },
        ),
      ),
    );
  }
}
