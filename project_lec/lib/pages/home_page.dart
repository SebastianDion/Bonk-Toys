import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_lec/pages/about_page.dart';
import 'package:project_lec/pages/login_page.dart';
import 'package:project_lec/pages/shop_page.dart';
import 'package:flutter/material.dart';

import '../components/bottom_nav_bar.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //This seleccted index is to control the bottom navbar
  int _selectedIndex = 0;
  //This method wil update selected index
  // when user taps on bot navbar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //Pages to display
  final List<Widget> _pages = [
    //shop page
    const ShopPage(),

    //cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        title: Text(
          "Shop Now",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //profile
          SizedBox(
            height: 70,
          ),
          Icon(
            Icons.account_circle_outlined,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "Me",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Divider(
              color: Colors.grey[800],
            ),
          ),
          //Home
          ListTile(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.home, color: Colors.white),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage())),
          ),
          //Icon About
          ListTile(
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.info, color: Colors.white),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'About',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                });
              }),
          //Icon Logout
          ListTile(
            title: Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25, top: 460),
              child: Row(
                children: [
                  Icon(Icons.logout_rounded, color: Colors.white),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Logout',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage())),
          ),
        ]),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
