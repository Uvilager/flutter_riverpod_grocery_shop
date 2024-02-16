import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_grocery_shop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_riverpod_grocery_shop/utils/theme/theme.dart';
import 'package:flutter_riverpod_grocery_shop/features/auth/data/auth_repository.dart';
import 'package:flutter_riverpod_grocery_shop/features/auth/presentation/login/signin_screen.dart';
import 'package:flutter_riverpod_grocery_shop/features/groceries/presentation/groceries_screen.dart';

void main() async {

  // TODO Sutra / Picture upload na Storage i Reference / Dark/Light mode
  // TODO Eager Initialization
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authStateChangesProvider,
      (previous, next) {},
    );
    final user = ref.watch(authStateChangesProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: appLightTheme,
        darkTheme: appDarkTheme,
        home: user.when(
          data: (user) {
            if (user == null) {
              return const SignInScreen();
            }
            return const GroceriesScreen();
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        )
        // home: const GroceriesScreen(),
        );
  }
}
