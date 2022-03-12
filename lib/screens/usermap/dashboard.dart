import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'location_tracking.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Locate TrashCans"),
        centerTitle: true,
        backgroundColor: HexColor("#1565C0"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                      return  LocationTracking();
                    })
                    );
                  }, child: Text("Trash Map"))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
