import 'package:flutter/material.dart';

class ArticleSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Search"),
      ),
      body: new Center(
        child: new Text("Ini Article Page"),
      ),
    );
  }

  Widget _buildArticles(){
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if(i.isOdd){
          new SizedBox(height: 1.0,);
        }
      }
    );
  }
} 