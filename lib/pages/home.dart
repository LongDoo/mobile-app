import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../functions/fetchNews.dart';
import 'package:http/http.dart' as http;
import '../model/News.dart';
import '../model/Data.dart';

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
                    child: Image.network(data.elementAt(index).imgUrl),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    data.elementAt(index).title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    )
                  ),
                )
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(
                context, '/news',
                arguments: Data(
                  data.elementAt(index).title,
                  data.elementAt(index).imgUrl,
                  data.elementAt(index).date,
                  data.elementAt(index).content
                )
              );
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
                    child: Image.network(data.elementAt(index).imgUrl),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    data.elementAt(index).title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    )
                  ),
                )
              ],
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/news',
                arguments: Data(
                  data.elementAt(index).title,
                  data.elementAt(index).imgUrl,
                  data.elementAt(index).date,
                  data.elementAt(index).content
                )
              );
            },
          )
        ];
        
        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (index == 0) ? _header : _content
          );
      }
    );
  }
}