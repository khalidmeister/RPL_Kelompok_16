import 'package:flutter/material.dart';
import 'login_page.dart';


class AccountSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Account"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Nama: Irfan Alghani Khalid"),
            new SizedBox(height: 20.0),
            new Text("Username: alghaniirfan"),
            new SizedBox(height: 20.0),
            new Text("Alamat: Jalan Bunga Indah No. 5e Kota Pekanbaru, Riau"),
            new SizedBox(height: 20.0),
            new Text("Nomor Telepon: 0811701870"),
            new SizedBox(height: 20.0),
            new SizedBox(
              height: 40.0,
              width: double.infinity,
              child: new ButtonTheme(
                buttonColor: Colors.redAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                child: new RaisedButton(
                  child: new Container( 
                    padding: new EdgeInsets.all(4.0),
                    child: new Text(
                      "Log Out",
                      style: new TextStyle(
                        fontSize: 24.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }
}