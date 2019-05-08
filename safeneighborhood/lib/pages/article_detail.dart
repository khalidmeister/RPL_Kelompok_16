import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

class ArticleDetail extends StatelessWidget {
  int index;
  List list; 
  ArticleDetail({this.index, this.list});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail")
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Container(
          padding: EdgeInsets.all(4.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,   
            child: Card(
              child: Container( 
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 10.0
                    )
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(list[index]['judul'], style: TextStyle(fontSize: 24.0)),
                    SizedBox(height: 20.0,),
                    Text(list[index]["deskripsi"], style: TextStyle(fontSize: 14.0),),
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}