import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'add_alert.dart';
import 'package:http/http.dart' as http;

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
    zoom: 11.0,
  );

  Set<Marker> _markers = {};

  List isi;

  Future<String> getData() async{
    final response = await http.get("http://10.1.206.161/tabel_sn/get_data_maps.php");
     
    setState(() {
      isi = json.decode(response.body);
    
      for(var i = 0; i < isi.length; i++){
        _markers.add(Marker(
          markerId: MarkerId(isi[i]['alert_id'].toString()),
          position: LatLng(double.parse(isi[i]['latitude']), double.parse(isi[i]['longitude'])),
          infoWindow: InfoWindow(
            title: isi[i]['deskripsi'],
            snippet: DateTime.parse(isi[i]['tanggal']).toString(),
          ),
          icon: BitmapDescriptor.defaultMarker,
          )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: Stack( 
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              getData();
              print(isi[0]['latitude']);
            },
            markers: _markers,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: new Container(
              padding: EdgeInsets.all(16.0),
              child: FloatingActionButton(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.add_alert),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddAlert())
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}