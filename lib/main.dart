import 'package:flutter/material.dart';
import 'splashscreen.dart';

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

void main() => runApp(Main());