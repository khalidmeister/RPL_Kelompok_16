import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddArticle extends StatelessWidget {
  TextEditingController _judulController = TextEditingController();
  TextEditingController _subJudulController = TextEditingController();
  TextEditingController _isiController = TextEditingController();

  void addData(){
    var url = "http://10.1.206.161/tabel_sn/add_data.php";
    http.post(url, body:
      {
        "judul": _judulController.text,
        "deskripsi": _isiController.text,
      }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Article"),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: _judulController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Judul dari artikel",
                  ),
                ),
                new SizedBox(height: 10.0),
                new TextField(
                  controller: _isiController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(16.0),
                    labelText: "Isi dari artikel",
                  ),
                  maxLines: 5,
                ),
                new SizedBox(height: 10.0),
                new SizedBox(
                  width: double.infinity,
                  height: 40.0,
                  child: new RaisedButton(
                    onPressed: () {
                      addData();
                      Navigator.pop(context);
                    },
                    color: Colors.blueAccent,
                    child: new Text("Submit", style: TextStyle(fontSize: 12.0, color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}