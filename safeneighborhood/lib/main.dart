import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/login_page.dart';
import './pages/main_app.dart';
import './pages/account_section.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safe Neighborhood',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
    );
  }
}


