import 'package:flutter/material.dart';

class NewsSecondPage extends StatelessWidget {
  final String title, imgUrl, date, content;

  NewsSecondPage({Key key, this.title, this.imgUrl, this.date, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}