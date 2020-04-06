import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halls_city/UI_componants/hall_properties.dart';
import 'package:halls_city/constants.dart' as constant;
import 'package:halls_city/models/hall.dart';
import 'package:halls_city/screens/reservation_screen.dart';

import 'location_screen(Empty).dart';

class HallScreen extends StatefulWidget {

  Hall hallObj;

  // intializing a new room a defualt one
  HallScreen({this.hallObj});

  @override
  _HallScreenState createState() => _HallScreenState();
}

class _HallScreenState extends State<HallScreen> {

  // these two variable are used to toggle favourite button
  bool isEnabled = false; // this to store the state of the button
  Color likeColor = Colors.grey; // and this to store buuton color


  @override
  Widget build(BuildContext context) {
    // to prvent myself from overriding on notification bar
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
            // back_icon is aconstant value
            icon: constant.back_icon,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          // adding the logo to the flexible space of abb par
          flexibleSpace: Padding(
            padding: constant.all_sides_padding,
            //adding the logo inside app bar flexibleSpace with 8 padding
            child: Image(
              image: constant
                  .darkLogo, // calling logo image from constants file
            ),
          ),
        ),
        // insering all widgets inside a single scroll view to make the scrollable
        body: SingleChildScrollView(
          //all my widgerts will be assigne into a column to be arranged vertically
          child: Column(
            children: <Widget>[
              //adding a constant padding to the image Carousel Slider
              Padding(
                padding: constant.three_sides_padding,
                //making the image border curvy not hard
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  child: Container(
                    color: constant.card_backgrund,
                    child: CarouselSlider.builder(
                      viewportFraction: 1.0,
                      //make the carousel shows only one image
                      autoPlay: true,
                      // enabling carousel auto play
                      itemCount: widget.hallObj.images.length,
                      //the number of images inside the caeousel
                      // itembuilder is a builder which builds set of slies with the number of itemcont
                      itemBuilder: (BuildContext context, int itemIndex) {
                        // building the carousel siles content
                        return Image(
                          image: constant.network_image3,
                          //using a test image from the constnts
                          width: MediaQuery // setting the width of the image with the width of the screen to fill its parent(Container)
                              .of(context)
                              .size
                              .width,
                          fit: BoxFit
                              .cover, // make the cover fill the container with the same ratio
                        );
                      },
                    ),
                  ),
                ),
              ),
              // a card which contains hall name , rating , some properties as icons and its location
              // this card is inside a padding
              Padding(
                // the padding is set to be a constant value with all_sides_padding
                padding: constant.all_sides_padding,
                //using this widget to clip the card corners with a constant value [circularBorder] radius
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  //putting the column inside a container to take control of card's color
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        // a row of widgets inside a padding which contains circle avatar , hall nme , its category and location icon
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              // the main image of the hall account inside a circle avatar to make it circular
                              CircleAvatar(
                                radius: 27.0,
                                backgroundImage: constant.network_image1,
                                backgroundColor: Colors.transparent,
                              ),
                              // adding hall name and category indide a column to align them vertically
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // hall name text widget inside a pading with only two sides padding
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8),
                                    // hall name text widget
                                    child: Text(
                                      widget.hallObj.placeName,
                                      // customizing the properties of the hall name text
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  // the hall category text widget inside only two sides padding
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 4),
                                    child: Text(widget.hallObj.category),
                                  )
                                ],
                              ),
                              // an expanded widget to make the other widgets at the sides of the row
                              Expanded(
                                // setting the child property because expanded widget can't be declared with null child
                                child: Container(),
                              ),
                              //creating icon button widget which shows the location of the hall on click
                              //with padding all sides
                              Padding(
                                padding: constant.all_sides_padding,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: constant.main_dark_color,
                                      size: 42.0
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) =>
                                            LocationScreen()));
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        // a row of some properties as icons
                        //with a padding outside the row
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              // calling a [getPropertyIcons] return a list of property icons which its availability for current hall
                              // and spreading the list of widgets to its elemnts by three dots
                              Expanded(
                                child: Wrap(
                                  children: <Widget>[
                                    ...widget.hallObj.getPropertyIcons(),
                                  ],
                                ),
                              ),
                              // an  expanded widget to make icons and ratingBar at the sides of the row
                              // rating bar which showing showing the midi rating of the hall
                              // calling rate bar from class [HallProprerties] as a static fun
                              Padding(
                                padding: constant.all_sides_padding,
                                child: HallProperties.customRateBar(
                                    rate: widget.hallObj.rating
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // adding pading to the hall properties box
              Padding(
                padding: constant.three_sides_padding,
                //making the box curvy
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  //inserting the column of hall properties to enable me to change background color
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: constant.all_sides_padding,
                          // creating a row containing room name and price per hour
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Properties',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: constant.main_dark_color
                                ),
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
                        ...widget.hallObj.getNamedProperties(),
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
                      //cliping the button edges with a common radius in the app which is circularBorder
                        child: HallProperties.customButton(
                            context: this.context,
                            //passign this context to the putton
                          text: 'Rent Now',
                          onclick: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                ReservationScreen(
                                  hallSchedule: widget.hallObj.schedule,
                                ))); // routing the
                          },
                        )
                    ),
                    // a toggle favourite button
                    IconButton( // creating an icon button to mark the hall as favourit
                      // setting the icon properity with favourit icon
                      icon: Icon(
                        Icons.favorite,
                        size: 30,
                      ),
                      color: likeColor,
                      //this local variable used to store changable color
                      onPressed: () {
                        setState(() {
                          // making the icon switchable
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