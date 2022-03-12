import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition initialPosition = CameraPosition(target: LatLng(4.161832393035532, 9.288086775661922), zoom: 14.0);
  static const CameraPosition finaPosition = CameraPosition(target: LatLng(4.1561307, 9.2854184), zoom: 14.0,bearing: 192.0, tilt: 60);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Dashboard"), centerTitle: true),
      body: GoogleMap(initialCameraPosition: initialPosition,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },),
      floatingActionButton: FloatingActionButton.extended(onPressed: () {
        goToGim();
      },
        label: const Text("Locate Trash"),
        icon: const Icon(Icons.directions_bus),),
    );
  }

  Future <void> goToGim() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(finaPosition));
  }

}


