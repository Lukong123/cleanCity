import 'package:cleancity/screens/dashboard/body.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  static String routeName = "/dashboards";
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
