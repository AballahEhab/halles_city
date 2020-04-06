import 'package:flutter/material.dart';
import 'package:halls_city/UI_componants/hall_properties.dart';
import 'package:halls_city/models/schedule.dart';

import '../constants.dart';

class Place {
  // this map stores the named properties which shows for the user as name and value in one line
  Map<String, dynamic> namedProperty;

  String placeName;

  //a list of images
  List images;

  Schedule schedule;

  Place({
    this.images,
    this.placeName,
  }) {
    this.namedProperty = Map();
    schedule = Schedule();
  }

  //adding a named property to the hall
  void addNamedProperty({String name, var value}) {
    namedProperty[name] = value;
  }

  // [getNamedProperties] function run in a loop in named property  list
  // and add every property as a widget in a list of widget in a custom UI component [creatNamedproperty]
  List<Widget> getNamedProperties() {
    // the list which we store widgets in to be returned finally
    List<Widget> namedProperties = List();

    //the loop
    this.namedProperty.forEach((propertyName, value) {
      // the property is set with a custom look called from [HallProperties] class as a static function [creatNamedproperty]
      namedProperties.add(HallProperties.creatNamedproperty(
        property: propertyName,
        value: value.toString(),
      ));
      namedProperties.add(custom_divider);
    });
    return namedProperties;
  }
}
