import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/News.dart';

Future<List<News>> fetchNews(http.Client client) async {
  final res = await client.get('http://45.76.181.50/posts');

  if (res.statusCode == 200) {
    List news = json.decode(res.body);
    return news.map((data) => News.fromJson(data)).toList(); 
  } else {
    throw Exception(res.reasonPhrase);
  }
}