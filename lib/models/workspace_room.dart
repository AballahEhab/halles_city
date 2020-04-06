import 'dart:core';

import 'package:halls_city/models/place.dart';


// room class is a model for workspace room with its all properies
//we wil  add methods if needed
class Room extends Place {


  // a constructor initializing basic information for the room and
  Room({
    String roomName,
    List roomImages,
    num pricePerHour,
    int numOfChairs,
  }) :super(
      placeName: roomName,
      images: roomImages
  ) {
    this.namedProperty['Price per hour'] = pricePerHour;
  }










}
