import 'package:flutter/material.dart';
import 'package:flutter_online_shop_bloc/core/resources/app_theme.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Shop',
      theme: AppTheme.light,
      home: const SplashPage(),
    );
  }
}
