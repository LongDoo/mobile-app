import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/News.dart';

Future<List<News>> fetchNews(http.Client client) async {
  final res = await client.get('https://my-json-server.typicode.com/LongDoo/mockdb/posts');

  if (res.statusCode == 200) {
    List news = json.decode(res.body);
    return news.map((data) => News.fromJson(data)).toList(); 
  } else {
    throw Exception(res.reasonPhrase);
  }
}