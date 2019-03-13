import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'screen.dart';

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