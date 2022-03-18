import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  const AppLayout(
      {Key? key,
      required this.topBar,
      required this.child,
      required this.bottomNavigationBar})
      : super(key: key);
  final Widget topBar;
  final Widget child;
  final Widget bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          topBar,
          Expanded(
            child: child,
          ),
          bottomNavigationBar,
        ],
      ),
    );
  }
}
