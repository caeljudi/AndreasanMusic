import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:andreasan/presentation/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
              Text("toto"),
            ],
          ),
        ),
      ),
      navigationBar: const Text("navigationbar"),
      playerBar: const Text("playerbar"),
      topBar: isFabVisible
          ? Container(
              height: 50,
              width: double.infinity,
              color: Theme.of(context).appTheme.colors.primary.lighter,
              child: const Text("topbar"),
            )
          : Container(),
    );
  }
}
