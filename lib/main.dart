import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_online_shop_bloc/core/resources/app_theme.dart';
import 'package:flutter_online_shop_bloc/features/auth/bloc/auth_cubit.dart';
import 'package:flutter_online_shop_bloc/features/auth/presentation/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fa')],
      locale: const Locale("fa"),
      title: 'Online Shop',
      theme: AppTheme.light,
      home: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
          child: const SplashPage()),
    );
  }
}
