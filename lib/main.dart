import 'package:flutter/material.dart';
import 'package:rick_and_morty/App/locator.dart';
import 'package:rick_and_morty/App/router.dart';
import 'package:rick_and_morty/App/theme.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      routerConfig: router,
    );
  }
}
