import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: MyHomePage(),
  ));
}
class MyHomePage extends StatefulWidget {
 MyHomePage({Key key}) : super(key: key);

 @override
 _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 int _selectedIndex = 0;
 final _widgetOptions = [
   ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(top: 20.0 ,bottom: 20.0, left: 10.0, right: 10.0),
      children: <Widget>[
        const Text('PUBG', textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.only(top: 10.0),),
        Image.network('https://i.ytimg.com/vi/EZ3PsAjI-i0/maxresdefault.jpg',),
        Padding(padding: EdgeInsets.only(top: 10.0 , bottom: 20.0),),
        const Text('SURVIVOR PASS: VIKENDI GUIDE!!', textDirection: TextDirection.ltr,),
        Padding(padding: EdgeInsets.only(top: 20.0),),
        const Text('CSGO', textDirection: TextDirection.ltr,style: TextStyle(fontWeight: FontWeight.bold),),
        Padding(padding: EdgeInsets.only(top: 10.0),),
        Image.network('https://cdn.vox-cdn.com/thumbor/GuHPno-E3uNDNofdMVaS9dfX2j0=/0x0:1895x919/1200x800/filters:focal(797x309:1099x611)/cdn.vox-cdn.com/uploads/chorus_image/image/62640216/csgo.0.png',
       ),
        Padding(padding: EdgeInsets.only(top: 10.0),),
        const Text('csgo free to play !!', textDirection: TextDirection.ltr,),
      ],
    ),
   Text('Index 1: Video'),
   Text('Index 2: Search'),
 ];
 final widgetOption = [
   Text('Game News'),
   Text('Video Game'),
   Text('Search'),
 ];

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 0, 0, 0),
       centerTitle: true,
       title: widgetOption.elementAt(_selectedIndex),
     ),
     body: Center(
       child: _widgetOptions.elementAt(_selectedIndex),
     ),
     bottomNavigationBar:BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(Icons.today), title: Text('Today')),
         BottomNavigationBarItem(icon: Icon(Icons.video_library), title: Text('Video')),
         BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Search')),
       ],
       currentIndex: _selectedIndex,
       fixedColor: Colors.deepOrange,
       onTap: _onItemTapped,
     ),
   );
 }

 void _onItemTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }
}