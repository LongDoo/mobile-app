import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<News>> fetchNews(http.Client client) async {
  final res = await client.get('https://jsonplaceholder.typicode.com/photos/1');

  return compute(parseNews, res.body);
}

List<News> parseNews(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<News>((json) => News.fromJson(json)).toList();
}

class News {
  final int id;
  final String title;
  final String thumbnailUrl;

  News({this.id, this.title, this.thumbnailUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Index 1: Home');
  }
}