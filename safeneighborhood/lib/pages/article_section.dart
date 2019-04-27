import 'package:flutter/material.dart';
import 'add_article.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class ArticleSection extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: new Text("Article"),
      ),
      body: new Center(
        child: ArticleList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: new Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute( builder: (context) => AddArticle())
          );
        },
      ),
    );
  }

  
} 

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  Future<List> getData() async{
    final response = await http.get("http://192.168.0.110/tabel_sn/get_data.php");
    return json.decode(response.body);
  }
  
  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<List>(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.hasError) print(snapshot.error);

        return snapshot.hasData ? new ItemList(list: snapshot.data) : new CircularProgressIndicator();
      }
    );
  }
}

class ItemList extends StatelessWidget {
  List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.widgets),
          title: new Text(list[i]["judul"]),
          subtitle: new Text(list[i]["sub_judul"]),
        );
      },
    );
  }
}