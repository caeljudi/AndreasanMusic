import 'package:andreasan/design_system/theme/app_theme.dart';
import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:andreasan/models/appuser.dart';
import 'package:andreasan/presentation/dashboard_layout.dart';
import 'package:andreasan/presentation/screens/authentication_wrapper.dart';
import 'package:andreasan/presentation/screens/home_page.dart';
import 'package:andreasan/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        title: 'AndreaSan',
        theme: ThemeManager.createTheme(AppTheme()),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}
