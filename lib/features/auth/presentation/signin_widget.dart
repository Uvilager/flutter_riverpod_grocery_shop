import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod_grocery_shop/features/auth/presentation/controllers.dart/auth_controller.dart';

class SignInWidget extends ConsumerStatefulWidget {
  const SignInWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends ConsumerState<SignInWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: _passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          const SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref.read(authControllerProvider.notifier).signUp(
                    email: _emailController.text,
                    password: _passwordController.text);
              }
            },
            child: const Text('Login'),
          ),
          // const SizedBox(height: 16.0),
          // TextButton(
          //   onPressed: () {
          //     context.go('/register');
          //     print('Sign Up button pressed');
          //   },
          //   child: const Text('Not registered? Sign Up'),
          // ),
        ],
      ),
    );
  }
}
