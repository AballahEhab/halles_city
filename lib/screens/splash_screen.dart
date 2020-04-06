import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'login_screen.dart';

class Splash extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  String lT ='Welcome to Halls City';
  @override
  Widget build(BuildContext context) {
    return SplashScreen(


      title: Text('Halls City',
        style: TextStyle(fontSize: 26.0,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
            fontFamily: 'Ballegra'),
      ),
      photoSize: 88.0,
      image: Image.asset('images/lightLogo.png', fit: BoxFit.cover,),
      loadingText: Text(
        lT,
        style: TextStyle(
            fontSize: 11.0,
            color: Colors.black54
        ),
      ),
      seconds: 5,
      navigateAfterSeconds: LoginScreen(),
      //this will be a method
    );
  }
}