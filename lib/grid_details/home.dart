import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:glass_morphism/navigation_bar/pages/fav_page.dart';
import '../navigation_bar/pages/category_page.dart';
import '../navigation_bar/pages/grid_home.dart';
import '../navigation_bar/pages/settings_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final List screens = [
      const GridHome(),
      const CategoryPage(),
      const Favorite(),
      const SettingsPage(),
    ];

    final items = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.category, size: 30),
      const Icon(Icons.favorite, size: 30),
      const Icon(Icons.settings, size: 30),
    ];

    return Scaffold(
      extendBody: true,
     
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Color.fromARGB(255, 26, 60, 119).withOpacity(0.4),
        toolbarHeight: 120,
        actions: [
         Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage('assets/images/profile.png')),

          ),
         )
        ],
      ),
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
        child: CurvedNavigationBar(
          items: items,
          height: 60,
          color: const Color.fromARGB(255, 29, 57, 104),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          index: index,
          onTap: ((index) => setState(
                () {
                  this.index = index;
                },
              )),
        ),
      ),
       body: screens[index],
    );
  }
}
