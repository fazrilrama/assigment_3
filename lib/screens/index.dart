import 'package:app_assigment_3/screens/album_screen.dart';
import 'package:app_assigment_3/screens/post_screen.dart';
import 'package:app_assigment_3/screens/user_screen.dart';
import 'package:flutter/material.dart';

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key, required this.title});

  final String title;

  @override
  State<AppHomePage> createState() => _appHomePage();
}

class _appHomePage extends State<AppHomePage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  String value = 'Item 1';

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Snackbar'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    PostOverviewScreen(),
    AlbumOverviewScreen(),
    UserOverviewScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Assignment 3'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Album',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}