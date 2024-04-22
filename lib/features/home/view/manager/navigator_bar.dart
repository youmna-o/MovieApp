import 'dart:ffi';

import 'package:final_movie_app_20/search_screen.dart';
import 'package:flutter/material.dart';

import '../../../profile/view/manager/theme_mode_manager.dart';
import '../../../profile/view/screens/profile_screen.dart';
import '../../../saved_movies/view/screens/saves_movies_screen.dart';
import '../screens/home_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  NavigationBarScreen({Key? key, required this.userEmail}) : super(key: key);
  final String userEmail;

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int selectedIndex = 0;
  late String userEmail;

  @override
  void initState() {
    super.initState();
    userEmail = widget.userEmail;
  }

  List<Widget> get widgets => [
    HomeScreen(),
    SearchScreen(),
    SavedMoviesScreen(),
    ProfileScreen(userEmail: userEmail),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xFF1F1F1F),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xFFF48D15),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(label: "Saved", icon: Icon(Icons.bookmark_add)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
        ),
      ),
      body: widgets.elementAt(selectedIndex),
    );
  }
}