import 'package:flutter/material.dart';
import 'package:notification/screens/subscriptions/subscriptionsScreen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    SubscriptionsScreen(),
    Icon(
      Icons.camera,
      size: 150,
    ),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 28,
        onTap: _onItemTapped,
      ),
    );
  }
}
