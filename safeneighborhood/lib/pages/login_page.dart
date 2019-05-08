import 'package:flutter/material.dart';
import './main_app.dart';

class LoginPage extends StatelessWidget{
  final TextEditingController _usernameTextController = new TextEditingController();
  final TextEditingController _passwordTextController = new TextEditingController();
  @override
  Widget build(BuildContext context){
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new KomponenLogin("Username", _usernameTextController),
          new SizedBox(height: 2.0,),
          new KomponenLogin("Password", _passwordTextController),
          new SizedBox(height: 2.0,),
          new TombolSubmit(),
        ],
      )
    );
  }
}

// Untuk TextField dari Login Page
class KomponenLogin extends StatelessWidget{
  String _subkata;
  TextEditingController textEditingController = new TextEditingController();
  KomponenLogin(this._subkata, this.textEditingController);

  @override
  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text(_subkata, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          new Container(
            padding: EdgeInsets.only(top: 8.0),
            child: new TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                contentPadding: EdgeInsets.all(16.0),
                labelText: _subkata,
              ),
              obscureText: _subkata == "Password" ? true : false,
              controller: textEditingController,
              style: TextStyle(
                color: Colors.white,
              ),
              
            ),
          ),
        ],
      )
    );
  }
}

// Untuk Submit Login buat ke Page Utama
class TombolSubmit extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: new EdgeInsets.all(16.0),
      child: ButtonTheme(
        minWidth: 30.0,
        height: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        child: new RaisedButton(
          color: Colors.red,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainApp()),
            );
          },
          child: new Container(
            padding: new EdgeInsets.all(13.0),
            child: new Text(
              "Masuk",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}