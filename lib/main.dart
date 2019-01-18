import 'package:flutter/material.dart';
import 'page.dart';

void main() => runApp(Main());

// Main class contain the entirely app's widget
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long Doo',
      home: Page(),
    );
  }
}
