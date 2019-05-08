import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _namaDepanController = TextEditingController();
  TextEditingController _namaBelakangController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _nomorTeleponController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _retypePassController = TextEditingController();

  void addData(){
    var url = "http://10.1.206.161/tabel_sn/add_data_user.php";
    http.post(url, body: {
      "nama_depan": _namaDepanController.text,
      "nama_belakang": _namaBelakangController.text,
      "email": _emailController.text,
      "nomor_telepon": _nomorTeleponController.text,
      "password": _passwordController.text,
    });
  }

  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.blueAccent,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 50.0,),
                Text("Registrasi", style: TextStyle(fontSize: 24.0, color: Colors.white),),
                SizedBox(height: 30.0,),
                TextField(
                  controller: _namaDepanController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Nama Depan",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: _namaBelakangController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Nama Belakang",
                    labelStyle: TextStyle(color: Colors.white)
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: _nomorTeleponController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Nomor Telepon",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                TextField(
                  controller: _retypePassController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Ketik Ulang Password",
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0,),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: new RaisedButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    color: Colors.redAccent,
                    child: new Container(
                      padding: new EdgeInsets.all(13.0),
                      child: new Text(
                        "Daftar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0
                        ),
                      ),
                    ),
                    onPressed: () {
                      addData();
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 20.0,),
                Align(alignment: Alignment.bottomCenter, child: Text(msg, style: TextStyle(color: Colors.white, fontSize: 14.0),),),
                SizedBox(height: 300.0,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
