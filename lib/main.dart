import 'package:cleancity/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const MyApp());
  Firebase.initializeApp();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: theme(),
      // ignore: prefer_const_constructors
      home:SplashScrren()
    );
  }
}
