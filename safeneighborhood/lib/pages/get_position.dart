import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetPosition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get that position"),
      ),
      body: GetMaps(),
    );
  }
}

class GetMaps extends StatefulWidget {
  @override
  _GetMapsState createState() => _GetMapsState();
}

class _GetMapsState extends State<GetMaps> {
  Completer<GoogleMapController> _controller = Completer();

  double _lat = 0.0;
  double _long = 0.0;

  LatLng _lastPosition = LatLng(-6.5595398,106.7326344);

  void _onCameraMove(CameraPosition position){
      _lastPosition = position.target;
      setState(() {
        _lat = position.target.latitude;
        _long = position.target.longitude;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          onCameraMove: _onCameraMove,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          initialCameraPosition: CameraPosition(
            target: _lastPosition,
            zoom: 2.0,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: new Container(
            padding: EdgeInsets.all(16.0),
            child: new Column(
              children: <Widget>[
                Text(_lat.toString()),
                SizedBox(height: 16.0,),
                Text(_long.toString()),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: new RaisedButton(
              color: Colors.blueAccent,
              child: Text(
                "Tambah Lokasi",
                style: TextStyle(
                  color: Colors.white,
                )
              ),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(Icons.location_on),
        ),
      ],
    );
  }
}