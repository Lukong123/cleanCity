import 'dart:async';
import 'package:cleancity/screens/onboard/onboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    var duration = const Duration(seconds: 7);
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
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: SizedBox(height: 150,
                    child: Container(
                      padding: const EdgeInsets.only(top: 30.0),
                      margin: EdgeInsets.only(top: 60),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/keepclean.svg',
                              height: 100,
                              width: 100,),
                            const Text("CleanCity",
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.bold,
                              ),)
                          ],
                        ),
                      ),
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
                      const Padding(
                          padding: EdgeInsets.only(top: 10),
                      ),
                      const Text("Powered By Teamclean",
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
