import 'package:flutter/material.dart';

import '../Constants.dart';

class AddHall extends StatefulWidget {
  @override
  _AddHallState createState() => _AddHallState();
}

class _AddHallState extends State<AddHall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_gray_color,
      // creating an app bar
      appBar: AppBar(
        //setting a color for the app bar
        backgroundColor: main_light_color,
        // creating back button at leading
        leading: IconButton(
          // back_icon is aconstant value
          icon: back_icon,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // adding the logo to the flexible space of abb par
        flexibleSpace: Padding(
          padding: all_sides_padding,
          //adding the logo inside app bar flexibleSpace with 8 padding
          child: Image(
            image: darkLogo, // calling logo image from constants file
          ),
        ),
      ),
    );
  }
}
