import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/HomePage/home1.dart';
import 'package:flutter_app/HomePage/home2.dart';
import 'package:flutter_app/HomePage/home3.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final widgetOptions = [new HomeFPage(), new HomeSPage(),new HomeTPage()];

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Flutter'),
      ),
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home1')),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_home_screen), title: Text('Home2')),
          BottomNavigationBarItem(
              icon: Icon(Icons.call_to_action), title: Text('Home3'))
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: onItemTapped,
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}

//https://www.xda-developers.com/files/2018/02/Flutter-Framework-Feature-Image-Red.png
