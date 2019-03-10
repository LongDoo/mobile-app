import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Main extends StatelessWidget {
  final _appname = 'Long Doo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appname,
      home: AppSplash()
    );
  }
}

class AppSplash extends StatefulWidget {
  _AppSplashState createState() => _AppSplashState();
}

class _AppSplashState extends State<AppSplash> {
  final _title = Text(
    'LONG DOO',
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30,
      color: Colors.white,
    ),
  );
  final _bgcolor = Color.fromARGB(255, 244, 182, 27);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: AfterSplash(),
      title: _title,
      image: Image.asset('assets/splash_icon.png'),
      photoSize: 200.0,
      backgroundColor: _bgcolor,
      loaderColor: Colors.black,
    );
  }
}

// Main Screen
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

// bottom navigation bar
class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key:key);

  @override 
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final _widgetOption  = [
    Text('Index 1: Home'),
    Text('Index 2: Search'),
    Text('Index 3: Video'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Doo'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
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

void main() => runApp(Main());
