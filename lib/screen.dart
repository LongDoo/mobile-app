import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/search.dart';
import './pages/videos.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key:key);

  @override 
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _widgetOption  = [
    HomePage(),
    SearchPage(),
    VideosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Doo'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _widgetOption.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('HOME')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title:Text('SEARCH')),
          BottomNavigationBarItem(icon: Icon(Icons.featured_video), title: Text('VIDEO')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.black,
        onTap: _onTapHandler,
      ),
    );
  }

  void _onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}