import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<News>> fetchNews(http.Client client) async {
  final res = await client.get('https://my-json-server.typicode.com/LongDoo/mockdb/posts');

  if (res.statusCode == 200) {
    List news = json.decode(res.body);
    return news.map((data) => News.fromJson(data)).toList(); 
  } else {
    throw Exception(res.reasonPhrase);
  }
}

class News {
  final int id;
  final String title, imgUrl, date, content;
  final List tag;

  News({this.id, this.title, this.imgUrl, this.date, this.content, this.tag});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      date: json['date'] as String,
      content: "https://github.com/LongDoo/mockdb/blob/master/markdown/$json['content']"
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<News>>(
      future: fetchNews(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.requireData);

        return snapshot.hasData ?
          NewsList(data: snapshot.data)
          : Center(child: CircularProgressIndicator());
      },
    );
  }
}

class NewsList extends StatelessWidget {
  final List<News> data;

  NewsList({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1,
      ),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return NewsListBuilder(news: data.elementAt(index), index: index);
      },
    );
  }
}

class NewsListBuilder extends StatelessWidget {
  final int index;
  final dynamic news;

  NewsListBuilder({Key key, this.news, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Widget> _header = <Widget>[
      Padding(
        padding: EdgeInsets.only(top: 20, left: 40, bottom: 10),
        child: Text(
          'Latest News',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          )
        ),
      ),
      RaisedButton(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(news.imgUrl),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                news.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                )
              ),
            )
          ],
        ),
        onPressed: () {
          return null;
        },
      )
    ];

    final List<Widget> _content = <Widget>[
      RaisedButton(
        color: Colors.white,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Image.network(news.imgUrl),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                news.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                )
              ),
            )
          ],
        ),
        onPressed: () {
          return null;
        },
      )
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (index == 0) ? _header : _content
    );
  }
}