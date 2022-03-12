import 'dart:async';

import 'package:cleancity/screens/onboard/onboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return StartState();
  }
 // _BodyState createState() => _BodyState();
}

class StartState extends State<Body> {
  @override
  void initState(){
    super.initState();
    startTimer();
  }
  startTimer() async{
    var duration = Duration(seconds: 7);
    return Timer(duration, route);
  }
  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>Onboard()));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset("assets/images/logo.png",
                        width: 150,
                        height: 200,)
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SpinKitSpinningLines(
                           color: HexColor("#1565C0")
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                      ),
                      Text("Powered By Teamclean",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}
