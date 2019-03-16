import 'package:flutter/material.dart';
import 'splashscreen.dart';
//
import './splashscreen.dart';
import './pages/home_second.dart';

class Main extends StatelessWidget {
  final _appname = 'Long Doo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _appname,
      theme: ThemeData(fontFamily: 'Kanit'),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings setting) {
        if (setting.name == '/news') {
          final args = setting.arguments;

          return MaterialPageRoute(
            builder: (context) {
              return NewsSecondPage(
                index: args
              );
            }
          );
        }
      },
      home: AppSplash()
    );
  }
}

void main() => runApp(Main());