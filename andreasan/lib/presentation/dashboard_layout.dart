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
          // Section principale 90% de l'écran //
          Expanded(
            flex: 9,
            child: _mainSection(context),
          ),
          // Section du mini player 10% de l'écran //
          Expanded(
            flex: 1,
            child: _playerSection(context),
          ),
        ],
      ),
    );
  }

  Container _playerSection(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Theme.of(context).appTheme.colors.primary.light,
      child: playerBar,
    );
  }

  Row _mainSection(BuildContext context) {
    return Row(
      children: [
        // Section navigation 20% de la main section (de 90 %) //
        Expanded(
          flex: 2,
          child: _navigationSection(context),
        ),
        // Section content principale 80 % de la main section (de 90%) //
        Expanded(
          flex: 8,
          child: _contentSection(context),
        ),
      ],
    );
  }

  Column _contentSection(BuildContext context) {
    return Column(
      children: [
        // Top bar section avec profile ect.. (definir une taille) //
        topBar,
        // Section du dashboard qui prends le reste de la place disponible sur la content section //
        Expanded(
          child: _content(context),
        ),
      ],
    );
  }

  Container _content(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      // width: double.infinity = prendre toute la width du container //
      width: double.infinity,
      // Theme.of(context).appTheme.ect à utiliser lorsque tu as des couleurs ou des textes //
      color: Theme.of(context).appTheme.colors.primary.medium,
      child: child,
    );
  }

  Container _navigationSection(BuildContext context) {
    return Container(
      color: Theme.of(context).appTheme.colors.primary.darker,
      child: navigationBar,
    );
  }
}
