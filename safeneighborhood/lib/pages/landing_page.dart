import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.lightBlueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Center(
            child: Image.asset('images/logo.png'),
          ),
          Divider(height: 150.0, color: Colors.lightBlueAccent,),
          new TombolAkun("LOG IN"),
          new TombolAkun("SIGN UP"),
          new Container(
            padding: EdgeInsets.all(32.0),
          ),
        ],
      )
    );
  }
}

class TombolAkun extends StatelessWidget{
  final String _kondisi;
  TombolAkun(this._kondisi);

  @override
  Widget build(BuildContext context){
    return new ButtonTheme(
      minWidth: 250.0,
      height: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: new RaisedButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => _kondisi == "LOG IN" ? LoginPage() : null));
        },
        child: new Container(
          padding: EdgeInsets.all(8.0),
          child: new Text(
            _kondisi,
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 14.0,
            ),
          ),  
        ),
      ),
    );
  }
}