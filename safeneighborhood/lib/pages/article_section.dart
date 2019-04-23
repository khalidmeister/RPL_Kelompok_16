import 'package:flutter/material.dart';

class ArticleSection extends StatefulWidget{
  @override
  ArticleSectionState createState() => new ArticleSectionState();
}

class ArticleSectionState extends State<ArticleSection>{
  @override
  Widget build(BuildContext context){
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if(i.isOdd){
            new Divider();
          }

          final int index = i ~/ 2;

        },
      )
    );
  }
}