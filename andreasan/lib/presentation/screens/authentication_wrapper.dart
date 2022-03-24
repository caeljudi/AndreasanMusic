import 'package:andreasan/controllers/user_controller.dart';
import 'package:andreasan/presentation/screens/navigation/navigator.dart';
import 'package:andreasan/presentation/screens/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AuthenticationWrapper extends GetView<UserController> {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      controller.initUser(firebaseUser);
      return const AppNavigator();
    }
    return SignInScreen();
  }

  void initUser(User? firebaseUser) async {
    if (firebaseUser != null) {
      controller.initUser(firebaseUser);
    }
  }
}
