import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:andreasan/presentation/dashboard_layout.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return DashboardLayout(
      child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          // Fonction pour agir en fonction du scrolling //
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              isFabVisible = true;
            });
          } else if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              isFabVisible = false;
            });
          }
          return true;
        },
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(firebaseUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            return Text(snapshot.data['name']);
          },
        ),
      ),
      navigationBar: const Text("navigationbar"),
      playerBar: const Text("playerbar"), 
      topBar: isFabVisible
          ? Container(
              height: 50,
              width: double.infinity,
              color: Theme.of(context).appTheme.colors.primary.lighter,
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signout();
                },
                child: const Text("Sign out"),
              ),
            )
          : Container(),
    );
  }
}
