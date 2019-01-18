import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var ref = Firestore.instance.collection('news');

var newsPage = StreamBuilder<QuerySnapshot>(
  stream: ref.snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError)
      return Text('Error: ${snapshot.hasError}');
    switch (snapshot.connectionState) {
      case ConnectionState.waiting: return Text('Waiting...');
      default:
        return ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Column(
              children: <Widget>[
                Container(
                  child: Text(document['title']),
                ),
                Container(
                  child: Text(document['excerpt']),
                ),
              ],
            );
          }).toList(),
        );
    }
  },
);