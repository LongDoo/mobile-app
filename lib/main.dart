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
  final _bgcolor =Color.fromARGB(255, 116, 9, 0);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: AfterSplash(),
      title: _title,
      image: Image.asset('assets/splash_icon.png'),
      photoSize: 200.0,
      backgroundColor: _bgcolor,
      loaderColor: Colors.yellowAccent,
    );
  }
}

// Main Screen
class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Doo'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text('Hello World!'),
      )
    );
  }
}

void main() => runApp(Main());