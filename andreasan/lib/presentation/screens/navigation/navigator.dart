import 'package:andreasan/design_system/theme/theme_manager.dart';
import 'package:andreasan/presentation/screens/navigation/favorite_page.dart';
import 'package:andreasan/presentation/screens/navigation/home_page.dart';
import 'package:andreasan/presentation/screens/navigation/music_page.dart';
import 'package:andreasan/presentation/screens/navigation/profile_page.dart';
import 'package:andreasan/presentation/widgets/app_layout.dart';
import 'package:andreasan/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:andreasan/presentation/widgets/top_bar/favorite_page_top_bar.dart';
import 'package:andreasan/presentation/widgets/top_bar/home_page_top_bar.dart';
import 'package:andreasan/presentation/widgets/top_bar/music_page_top_bar.dart';
import 'package:andreasan/presentation/widgets/top_bar/profile_page_top_bar.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  int _selectedIndex = 0;

  // Rajoute juste ton AppPages ici si tu veux créer une nouvelle page ;) avec la page en question, et la topbar //
  // TO DO : Créer les pages home, music, favorite, profile ainsi que leur topbar //
  List<AppPages> pages = <AppPages>[
    AppPages(page: HomePage(), topBar: HomePageTopBar()),
    AppPages(page: MusicPage(), topBar: MusicPageTopBar()),
    AppPages(page: FavoritePage(), topBar: FavoritePageTopBar()),
    AppPages(page: ProfilePage(), topBar: ProfilePageTopBar()),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // LAYOUT DE L'APPLI MOBILE y'en aura un autre pour la partie desktop mais on changera juste la bottomnavigationbar //
        body: AppLayout(
          child: pages[_selectedIndex].page,
          bottomNavigationBar: CustomBottomNavigationBar(
            onTap: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            selectedColor: Theme.of(context).appTheme.colors.primary.darker,
            selectedSize: 30,
            selectedIndex: _selectedIndex,
            items: const [
              CustomBottomNavigationBarItems(
                label: Text("Accueil"),
                icon: Icon(Icons.home),
              ),
              CustomBottomNavigationBarItems(
                label: Text("Musique"),
                icon: Icon(Icons.music_note),
              ),
              CustomBottomNavigationBarItems(
                label: Text("Favoris"),
                icon: Icon(Icons.favorite),
              ),
              CustomBottomNavigationBarItems(
                label: Text("Profile"),
                icon: Icon(Icons.person),
              ),
            ],
          ),
          // topbar a crée pour chaque pages que tu fais car ça fait partie du layout =>>>> regarde plus haut List<AppPages> //
          topBar: Container(
            width: double.infinity,
            height: 80,
            color: Colors.red,
            child: pages[_selectedIndex].topBar,
          ),
        ),
      ),
    );
  }
}

class AppPages {
  Widget page;
  Widget topBar;
  AppPages({
    required this.page,
    required this.topBar,
  });
}
