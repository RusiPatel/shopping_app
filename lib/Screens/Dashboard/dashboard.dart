import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/Dashboard/cart.dart';
import 'package:shopping_app/Screens/Dashboard/home_page.dart';
import 'package:shopping_app/Screens/Dashboard/offers.dart';
import 'package:shopping_app/Screens/Dashboard/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key})
      : super(key: key);
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
 void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const  TextStyle optionstyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 50);
  final List<Widget> _widgetoption = <Widget>[
    HomePage(),
    Offers(),
    Cart(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetoption[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.percent_outlined), label: "Offers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: "Your Cart"),
          BottomNavigationBarItem(

              icon: Icon(Icons.perm_identity), label: "Profile"),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.orangeAccent,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
