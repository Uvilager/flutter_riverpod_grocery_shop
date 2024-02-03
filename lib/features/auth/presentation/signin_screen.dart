import 'package:flutter/material.dart';
import 'package:flutter_riverpod_grocery_shop/features/auth/presentation/signin_widget.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SignInWidget(),
      ),
    );
  }
}
