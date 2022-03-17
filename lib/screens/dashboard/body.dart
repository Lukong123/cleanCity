import 'package:cleancity/screens/usermap/dashboard.dart';
import 'package:cleancity/screens/usermap/location_tracking.dart';
import 'package:cleancity/screens/usermap/map_trash.dart';
import 'package:cleancity/screens/usermap/trash_map.dart';
import 'package:cleancity/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentIndex = 0;
  final scrrens=[
    Dashboard(),
    MapTrash(),
  ];
  @override
  Widget build(BuildContext context)=>Scaffold(
      body:scrrens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index)=> setState(() => currentIndex = index),
        //type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          backgroundColor: HexColor("#1565C0"),
          iconSize: 30,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label:'Home',
              backgroundColor: Colors.blueAccent,

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label:'Trash',
              backgroundColor: Colors.green,
            ),
          ]
      ),
    );
  }

