import 'package:flutter/material.dart';
import 'package:halls_city/UI_componants/hall_properties.dart';
import 'package:halls_city/models/place.dart';

//this class is a parent class for all halls categories

class Hall extends Place {
  //this map stores boolean values for properties which performed in ui as icons
  Map<IconData, bool> propertyIcon;

  String category;

  //hall location
  var location;

  num rating;

  Hall({
    String name,
    List hallImages,
    this.category,
    this.location,
    this.rating,
    String address,
    bool wifi,
    bool WC,
  }) : super(
          placeName: name,
          images: hallImages,
        ) {
    propertyIcon = Map();
    this.namedProperty['Address'] = address;
    this.propertyIcon[Icons.wifi] = wifi;
    this.propertyIcon[Icons.wc] = WC;
  }

  // adding a new property icon to the hall
  void addpropertyIcon({IconData name, bool value}) {
    propertyIcon[name] = value;
  }

  // [getPropertyIcons] function run in a loop in property icons list
  // and add every property as an icon in a list of widget in a custom UI component [creatPropertyIcon]
  List<Widget> getPropertyIcons() {
    // the list which we store widgets in to be returned finally
    List<Widget> iconsList = List();

    //the loop
    this.propertyIcon.forEach((iconData, state) {
      //adding a new icon widget to the list
      iconsList.add(
          // the icon is set with a custom look called from [HallProperties] class as a static function [creatPropertyIcon]
          HallProperties.creatPropertyIcon(
              iconName: iconData, isEnabled: state));
    });
    return iconsList;
  }
}
