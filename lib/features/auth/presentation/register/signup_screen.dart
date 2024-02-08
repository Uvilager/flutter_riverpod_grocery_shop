import 'package:flutter/material.dart';

import 'package:flutter_riverpod_grocery_shop/features/auth/presentation/register/signup_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SignUpWidget(),
      ),
    );
  }
}
