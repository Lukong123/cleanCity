import 'dart:async';
import 'dart:ffi';
import 'package:cleancity/screens/usermap/distance.dart';
import 'package:cleancity/screens/usermap/google_map_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationTracking extends StatefulWidget {
  @override
  _LocationTrackingState createState() => _LocationTrackingState();
}

class _LocationTrackingState extends State<LocationTracking> {

  LatLng sourceLocation = LatLng(4.161374811893803, 9.287037239404137);
  //additionals
  LatLng destinationLatlng = LatLng(4.149157714937863, 9.288312937006145);
  LatLng destinationLatlng2 = LatLng(4.179157714937863, 9.388312937006145);
  LatLng destinationLatlng3 = LatLng(4.049157714937863, 9.188312937006145);


  bool isLoading= true;
  Completer<GoogleMapController> _controller =Completer();

  Set<Marker> _marker = Set <Marker>();

  Set <Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;

  late StreamSubscription<LocationData> subscription;

  late  LocationData currentLocation;
  late LocationData destinationLocation;
  //addtional locations
  late LocationData destinationLocation2;
  late LocationData destinationLocation3;
  late Location location;

  @override
  void initState(){
    super.initState();

    location = Location();
    polylinePoints = PolylinePoints();

    subscription = location.onLocationChanged.listen((clocation) {
      currentLocation = clocation;
    });
    setInitialLocation();
  }

  void setInitialLocation() async{

    currentLocation = await location.getLocation();
    LatLng(sourceLocation.latitude, sourceLocation.longitude);
    await location.getLocation();

    destinationLocation = LocationData.fromMap(
        {
      "latitude": destinationLatlng.latitude,
      "longitude": destinationLatlng.longitude,
      }


    );

    //other locations
    destinationLocation2 = LocationData.fromMap(
        {
          "latitude": destinationLatlng2.latitude,
          "longitude": destinationLatlng2.longitude,
        });

    destinationLocation3 = LocationData.fromMap(
        {
          "latitude": destinationLatlng3.latitude,
          "longitude": destinationLatlng3.longitude,
        });

  }

  void showLocationPins(){
    var sourceposition = LatLng(
        currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);

    var destinationPosition = LatLng(
        destinationLatlng.latitude, destinationLatlng.longitude);

    //add destinations
    var destinationPosition2 = LatLng(
        destinationLatlng2.latitude, destinationLatlng2.longitude);
    var destinationPosition3 = LatLng(
        destinationLatlng3.latitude, destinationLatlng3.longitude);



    _marker.add(Marker(
      markerId:MarkerId('sourcePosition'),
      position: sourceposition,
    ),);

    _marker.add(Marker(
      markerId: MarkerId('destinationPosition'),
      position: destinationPosition,
    ),
    );

    //add markers
    _marker.add(Marker(
      markerId: MarkerId('destinationPosition2'),
      infoWindow: InfoWindow(
        title: 'Trash_01',
        snippet: 'Location of Trash1',
      ),
      position: destinationPosition2,
    ),
    );

    _marker.add(Marker(
      markerId: MarkerId('destinationPosition3'),
      position: destinationPosition3,
    ),
    );




    setPolylinesInMap();
  }
  
  void setPolylinesInMap() async{

    var result = await polylinePoints.getRouteBetweenCoordinates(
        GoogleMapApi().url,
        PointLatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0),
        PointLatLng(destinationLatlng.latitude, destinationLatlng.longitude),
    );

    //additional coordinates
    var  result2 = await polylinePoints.getRouteBetweenCoordinates(GoogleMapApi().url,
      PointLatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0),
      PointLatLng(destinationLatlng2.latitude, destinationLatlng2.longitude),);

    var  result3 = await polylinePoints.getRouteBetweenCoordinates(GoogleMapApi().url,
      PointLatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0),
      PointLatLng(destinationLatlng3.latitude, destinationLatlng3.longitude),);
    //End Additional coordinates

    //get distance between points
    var dis1 = calculateDistance(currentLocation.latitude, currentLocation.longitude, destinationLatlng.latitude, destinationLatlng.longitude);
    var dis2 = calculateDistance(currentLocation.latitude, currentLocation.longitude, destinationLatlng2.latitude, destinationLatlng2.longitude);
    var dis3 = calculateDistance(currentLocation.latitude, currentLocation.longitude, destinationLatlng3.latitude, destinationLatlng3.longitude);
    //End get distance between points



    if(result.points.isNotEmpty){

      result.points.forEach((pointLatlng) {
        polylineCoordinates
            .add(LatLng(pointLatlng.latitude, pointLatlng.longitude));
      });
    }

    setState(() {
      _polylines.add(Polyline(
        width: 10,
        polylineId: const PolylineId('polyline'),
        color: Colors.blueAccent,
        points: polylineCoordinates,
      ));
    });
  }

  void updatePinsOnMap() async {

    CameraPosition cameraPosition = CameraPosition(
      zoom: 20,
      tilt: 80,
      bearing:30,
      target: LatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0),
    );
    
    final GoogleMapController controller = await _controller.future;
    
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    var sourcePosition = LatLng(
        currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0);

   setState(() {
     _marker.removeWhere((marker) => marker.mapsId.value =='sourcePosition');

     _marker.add(Marker(
       markerId: MarkerId('sourcePosition'),
       position: sourcePosition,
     ));
   });
  }


  @override
  Widget build(BuildContext context) {
    
    CameraPosition initialCameraPosition= CameraPosition(
      zoom: 20.0,
      tilt: 40,
      bearing: 10,
      target:LatLng(currentLocation.latitude ?? 0.0, currentLocation.longitude ?? 0.0)
    );
    
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: _marker,
          polylines: _polylines,
          mapType: MapType.normal,
          initialCameraPosition:initialCameraPosition,
          onMapCreated: (GoogleMapController controller){
            _controller.complete(controller);

            showLocationPins();
          },
        ),
      ),
    );
  }
}
