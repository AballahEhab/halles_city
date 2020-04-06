import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:halls_city/screens/home_screen(empty).dart';
import 'package:halls_city/screens/splash_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // This widget is the root of the application.
    return MaterialApp(
      //removing debug mode bunner
      debugShowCheckedModeBanner: false,
      //calling [HomeScreen] constructor as a home page
      home: HomeScreen(),
    );
  }
}

