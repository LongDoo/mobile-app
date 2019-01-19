import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// create a reference of data
final ref = Firestore.instance.collection('news');
// Temporary image
// TODO: programatrically fetch news' image
String imgUrl = 'https://firebasestorage.googleapis.com/v0/b/longdoo-9f16b.appspot.com/o/hello-world.jpg?alt=media&token=a609b0d5-0e5f-41a2-a1c2-a31d7fa04fe4';

final newsPage = StreamBuilder<QuerySnapshot>(
  stream: ref.snapshots(),
  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError)
      return Text('Error: ${snapshot.hasError}');
    switch (snapshot.connectionState) {
      case ConnectionState.waiting: return Text('Waiting...'); // Loading if no data to serve
      default:
        return ListView(
          // Symmetric padding adding of a list
          padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 10.0
          ),
          // Bind data to list using list
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return Column(
              // Horizontal align to left
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ClipRRect is used to create a border radius
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(imgUrl),
                ),
                // Padding under image 5px
                Padding(
                  padding: EdgeInsets.only(
                    bottom: 5.0,
                  )
                ),
                // Title text should be noticeable so the text is bold and large 
                Text(
                  document['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                // The excerpt of the news
                Text(document['excerpt']),
              ],
            );
          }).toList(), // Change iterable to a list
        );
    }
  },
);