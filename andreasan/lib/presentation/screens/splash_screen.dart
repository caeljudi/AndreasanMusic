import 'package:andreasan/models/appuser.dart';
import 'package:andreasan/presentation/screens/authenticate_screen.dart';
import 'package:andreasan/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({Key? key}) : super(key: key);

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user != null) {
      return Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text("press"),
            onPressed: null,
          ),
        ),
      );
    } else {
      return AuthenticateScreen();
    }
  }
}
