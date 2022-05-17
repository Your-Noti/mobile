import 'package:flutter/material.dart';
import 'package:notification/screens/subscriptions/subscriptionsScreen.dart';
import 'package:notification/screens/dashboard/dashboard_screen.dart';
import 'package:notification/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenScreenState createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    DashboardScreen(),
    // SubscriptionsScreen(),
    Icon(
      Icons.chat,
      size: 150,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.appName).tr(), actions: [
        IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {},
        )
      ]),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.filter_list),
          //   label: 'Subscription',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'test',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        iconSize: 28,
        onTap: _onItemTapped,
      ),
    );
  }
}
