import 'package:flutter/material.dart';
import 'pages/news.dart';

class Page extends StatefulWidget {
  // constructor
  Page({Key key}) : super(key: key);

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  int _selectedIndex = 0;
  final _widgetOptions = [
    newsPage,
    Text('Index 1: Video'),
    Text('Index 2: Search'),
  ];
  final widgetOption = [
    Text('Game News'),
    Text('Video Game'),
    Text('Search'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        centerTitle: true,
        title: widgetOption.elementAt(_selectedIndex),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.today), title: Text('Today')),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), title: Text('Video')),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}