import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        '/login' : (context) => LoginPage(),
        '/feed' : (context) => FeedPage(),
      },
    );
  }
}


