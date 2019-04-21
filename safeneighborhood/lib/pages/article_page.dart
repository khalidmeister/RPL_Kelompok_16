import 'package:flutter/material.dart';


class ArticlePage extends StatefulWidget{
  @override
  ArticlePageState createState() => ArticlePageState();
}

class ArticlePageState extends State<ArticlePage>{
  // Menampilkan indeks dan jusul saat ini
  int _selectedIndex = 0;
  String _pageTitle = "Home";
  
  // Widget _currentPage;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("SafeNeighborhood: " + _pageTitle),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: new Center(
        child: new Text("Ini Page dari " + _pageTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text("Search")),
          BottomNavigationBarItem(icon: new Icon(Icons.library_books), title: new Text("Article")),
          BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text("Account")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.lightBlueAccent,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){

    // Ini akan mengupdate state yang ada di tampilan aplikasi
    setState(() {
      switch (index) {
        case 0:
          _pageTitle = "Home";
          break;
        case 1:
          _pageTitle = "Search";
          break;
        case 2:
          _pageTitle = "Article";
          break;
        default:
          _pageTitle = "Account";
      }
     _selectedIndex = index; 
    }
    );

    //Debug buat tombol  
    print("Anda sekarang berada di index ke: " + _selectedIndex.toString());
  }
}