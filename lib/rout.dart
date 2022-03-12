import 'dart:js';

import 'package:cleancity/screens/onboard/onboard.dart';
import 'package:cleancity/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes ={
  SplashScrren.routeName:(context)=>SplashScrren(),
  Onboard.routeName:(context)=>Onboard(),
};