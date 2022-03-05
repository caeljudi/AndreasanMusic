import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:flutter/material.dart';

// Le Layout de l'application
class DashboardLayout extends StatelessWidget {
  const DashboardLayout(
      {Key? key,
      required this.navigationBar,
      required this.playerBar,
      required this.topBar,
      required this.child})
      : super(key: key);
  final Widget navigationBar;
  final Widget playerBar;
  final Widget topBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Section principale //
          _mainSection(context),
          // Section du mini player //
          _playerSection(context),
        ],
      ),
    );
  }

  Expanded _playerSection(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: 60,
        width: double.infinity,
        color: Theme.of(context).appTheme.colors.primary.light,
        child: playerBar,
      ),
    );
  }

  Expanded _mainSection(BuildContext context) {
    return Expanded(
      flex: 9,
      child: Row(
        children: [
          // Section navigation //
          _navigationSection(context),
          // Section content principale //
          _contentSection(context),
        ],
      ),
    );
  }

  Expanded _contentSection(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Column(
        children: [
          // Top bar section avec profile ect.. //
          topBar,
          // Section du dashboard //
          _content(context),
        ],
      ),
    );
  }

  Expanded _content(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        width: double.infinity,
        color: Theme.of(context).appTheme.colors.primary.medium,
        child: child,
      ),
    );
  }

  Expanded _navigationSection(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        color: Theme.of(context).appTheme.colors.primary.darker,
        child: navigationBar,
      ),
    );
  }
}
