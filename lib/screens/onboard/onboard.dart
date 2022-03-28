import 'package:cleancity/screens/onboard/body.dart';
import 'package:flutter/material.dart';

class Onboard extends StatefulWidget {
  static String routeName = "/onboard";
  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
