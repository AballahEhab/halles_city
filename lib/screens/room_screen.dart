import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halls_city/UI_componants/hall_properties.dart';
import 'package:halls_city/models/workspace_room.dart';
import 'package:halls_city/screens/reservation_screen.dart';

import '../constants.dart' as constant;

class RoomScreen extends StatefulWidget {
  Room currentRoom;

  RoomScreen({this.currentRoom });

  @override
  _RoomScreenState createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  // these two variable are used to toggle favourite button
  bool isEnabled = false; // this to store the state of the button
  Color likeColor = Colors.grey; // and this to store button color

  @override
  Widget build(BuildContext context) {
    // to prevent the app from overriding on notification bar
    return SafeArea(
      // the largest widget of material app which contains all other widgets
      child: Scaffold(
        backgroundColor: constant.light_gray_color,
        // creating an app bar
        appBar: AppBar(
          //setting a color for the app bar
          backgroundColor: constant.main_light_color,
          // creating back button at leading
          leading: IconButton(
            // back_icon is a constant value
            icon: constant.back_icon,
            color: constant.main_dark_color,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // adding the logo to the flexible space of app bar
          flexibleSpace: Padding(
            padding: constant.all_sides_padding,
            child: Image(
              image: constant.darkLogo,
            ),
          ),
        ),
        // inserting all widgets inside a single scroll view to make the scrollable
        body: SingleChildScrollView(
          //all my widgets will be assign into a column
          child: Column(
            children: <Widget>[
              //adding a constant padding to the image
              Padding(
                padding: constant.three_sides_padding,
                //making the image border curvy not hard
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  child: Container(
                    child: CarouselSlider.builder(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      itemCount: widget.currentRoom.images.length,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return Image(
                          image: widget.currentRoom.images[itemIndex],
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
              ),
              // adding padding to the hall details box
              Padding(
                padding: constant.three_sides_padding,
                //making the box curvy
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  //inserting the column od hall properties to enable me to change background color
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: constant.all_sides_padding,
                          // creating a row containing room name and price per hour
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                widget.currentRoom.placeName,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: constant.main_dark_color),
                              ),
                            ],
                          ),
                        ),

                        // a divider with a different padding under room name
                        Padding(
                          padding: const EdgeInsets.only(left: 70, right: 70),
                          child: Divider(
                            height: 0,
                          ),
                        ),

                        // creating all room properties by func creatHallproperty with its two properties
                        // and a custom divider befor each property
                        ...widget.currentRoom.getNamedProperties(),
                      ],
                    ),
                  ),
                ),
              ),

              //Rent now Button in a padding widget
              Padding(
                padding: constant.all_sides_padding,
                // the row consists of two widgets
                //the button and favourite button
                child: Row(
                  children: <Widget>[
                    // putting the button into an expanded widget to fill the
                    // residual space inside the row
                    Expanded(
                      //Calling a static custom button func with class name(HallProperties)
                        child: HallProperties.customButton(
                            context: this.context,
                          //setting the current context which we are working in
                          text: 'Rent Now',
                          //the text of the button
                          onclick: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                ReservationScreen(
                                  hallSchedule: widget.currentRoom.schedule,
                                ))); // routing the
                          },
                        )
                    ),
                    // a toggle favourite button
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      color: likeColor,
                      onPressed: () {
                        setState(() {
                          isEnabled
                              ? {likeColor = Colors.grey, isEnabled = false}
                              : {likeColor = Colors.red[700], isEnabled = true};
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
