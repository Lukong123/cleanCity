

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';


class MapTrash extends StatefulWidget {
  @override
  _MapTrashState createState() => _MapTrashState();
}
class _MapTrashState extends State<MapTrash> {

  //defining the map Controller
  late GoogleMapController myController;

  //setting the marker
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  //Creating a method for the marker
  void initMarker(specify, specifyId) async {
    var markerIdVal = specifyId;
    final MarkerId markerId = MarkerId(markerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(specify['location'].latitude, specify['location'].longitude),
        infoWindow: InfoWindow(
            title: 'Trash',
            snippet: specify['address'])
    );
    //setting the state of the method
    setState(() {
      markers[markerId] = marker;
    });
  }
  //getting location from firebase
  getMarKerData() async {
    //FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseFirestore.instance.collection('data').get().then((myMockData) {
      if (myMockData.docs.isNotEmpty) {
        for (int i = 0; i < myMockData.docs.length; i++) {
          initMarker(myMockData.docs[i].data, myMockData.docs[i].id);
        }
      }
    });
    //Getting the main branch of the children widget
  }
    void initState() {
      getMarKerData();
      super.initState();
    }
    @override
    Widget build(BuildContext context) {
      //Setting the markers
      Set<Marker> getMarker() {
        return <Marker>[
          Marker(
              markerId: MarkerId("Trash Locate"),
              position: LatLng(4.161385512444317, 9.287080154746542),
              icon: BitmapDescriptor.defaultMarker,
              infoWindow: InfoWindow(title: 'Trash')
          )
        ].toSet();
      }
      return Scaffold(
          body: GoogleMap(
            markers:getMarker(),
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(4.161385512444317, 9.287080154746542),
              zoom: 14.0,),
            //calling the controller
            onMapCreated: (GoogleMapController controller) {
              myController = controller;
            },
          )
      );
    }
  }

//Set<Marker>.of(markers.values)