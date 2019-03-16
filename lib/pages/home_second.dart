import 'package:flutter/material.dart';

class NewsSecondPage extends StatelessWidget {
  final int index;

  NewsSecondPage({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: Center(
        child: Text(index.toString()),
      ),
    );
  }
}