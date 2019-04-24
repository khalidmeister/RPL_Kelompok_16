import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: new Text("Home"),
      ),
      body: Maps(),
    );
  }
}

class Maps extends StatefulWidget{
  @override
  MapsState createState() => new MapsState();
}

class MapsState extends State<Maps>{
  Completer<GoogleMapController> _controller = new Completer();

  static final CameraPosition _kGooglePlex = new CameraPosition(
    target: LatLng(-6.5637955,106.7190907),
    zoom: 20,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414
  );

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake(),
        label: new Text('To The Lake!'),
        icon: new Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}