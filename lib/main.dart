import 'package:flutter/material.dart';
import 'splashscreen.dart';
//
import './splashscreen.dart';
import './pages/home_second.dart';
import './model/Data.dart';

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
          final Data args = setting.arguments;

          return MaterialPageRoute(
            builder: (context) {
              return NewsSecondPage(
                title: args.title,
                imgUrl: args.imgUrl,
                date: args.date,
                content: args.content,
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