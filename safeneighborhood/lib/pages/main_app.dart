import 'package:flutter/material.dart';
import 'account_section.dart';
import 'home_section.dart';
import 'search_section.dart';
import 'article_section.dart';

class MainApp extends StatefulWidget{
  @override
  MainAppState createState() => MainAppState();
}

class MainAppState extends State<MainApp>{
  // Menampilkan indeks dan jusul saat ini
  List<Widget> pages = [
    new HomeSection(),
    new SearchSection(),
    new ArticleSection(),
    new AccountSection(),
  ];
  int _selectedIndex = 0;
  String _pageTitle = "Home";
  
  // Widget _currentPage;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("Home")),
          BottomNavigationBarItem(icon: new Icon(Icons.search), title: new Text("Search")),
          BottomNavigationBarItem(icon: new Icon(Icons.library_books), title: new Text("Article")),
          BottomNavigationBarItem(icon: new Icon(Icons.account_circle), title: new Text("Account")),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.lightBlue,
        unselectedItemColor: Colors.blueGrey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){

    // Ini akan mengupdate state yang ada di tampilan aplikasi
    setState(() {
     _selectedIndex = index; 
    }
    );

    //Debug buat tombol  
    print("Anda sekarang berada di index ke: " + _selectedIndex.toString());
  }
}