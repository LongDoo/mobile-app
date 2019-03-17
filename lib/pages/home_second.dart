import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class NewsSecondPage extends StatelessWidget {
  final String title, imgUrl, date, content;

  NewsSecondPage({Key key, this.title, this.imgUrl, this.date, this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Markdown(data: content)
    );
  }
}