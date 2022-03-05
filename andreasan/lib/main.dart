import 'package:andreasan/design_system/theme/app_theme.dart';
import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:andreasan/presentation/dashboard_layout.dart';
import 'package:andreasan/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AndreaSan',
      theme: ThemeManager.createTheme(AppTheme()),
      home: const HomePage(),
    );
  }
}
