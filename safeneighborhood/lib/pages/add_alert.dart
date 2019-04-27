import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

double _lat = 0.0;
double _long = 0.0;

LatLng _lastPosition = LatLng(-6.5595398,106.7326344);

class AddAlert extends StatelessWidget {
  TextEditingController _deskripsiController = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;
  
  void _onSubmit(){
    var url = "http://192.168.0.110/tabel_sn/add_data_alert.php";
    http.post(url, body: 
      {
        "deskripsi": _deskripsiController.text,
        "latitude": _lat.toString(),
        "longitude": _long.toString(),
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Alert"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(16.0),
                labelText: "Deskripsikan",
              ),
            ),
            SizedBox(height: 10.0,),
            SizedBox(
              height: 200.0,
              width: double.infinity,
              child: GetPosition(),
            ),
            SizedBox(
              height: 20.0,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.redAccent,
                child: Text(
                  "Laporkan",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed:() {
                  _onSubmit();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetPosition extends StatefulWidget {
  @override
  _GetPositionState createState() => _GetPositionState();
}

class _GetPositionState extends State<GetPosition> {
  Completer<GoogleMapController> _controller = Completer();

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
            zoom: 10.0,
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
          alignment: Alignment.center,
          child: Icon(
            Icons.location_on, 
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}