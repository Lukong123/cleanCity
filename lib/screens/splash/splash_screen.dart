import 'package:cleancity/screens/splash/body.dart';
import 'package:flutter/material.dart';

class SplashScrren extends StatefulWidget {
  static String routeName = "/splash_screen";
  const SplashScrren({Key? key}) : super(key: key);

  @override
  _SplashScrrenState createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

