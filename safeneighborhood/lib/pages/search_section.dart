import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Search"),
      ),
      body: new Center(
        child: new Text("Ini Search Page"),
      ),
    );
  }
}