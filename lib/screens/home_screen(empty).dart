import 'package:flutter/material.dart';
import 'package:halls_city/models/hall.dart';
import 'package:halls_city/models/schedule.dart';
import 'package:halls_city/models/workspace.dart';
import 'package:halls_city/models/workspace_room.dart';
import 'package:halls_city/screens/workspace_screen.dart';

import '../constants.dart';
import 'hall_screen.dart';

// a test class to test data receiving

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Work Space'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WorkSpaceScreen(
                              workSpace: WorkSpace(
                                  workSpaceName: 'My WorkSpce',
                                  workSpaceImages: [
                                    network_image1,
                                    network_image2,
                                    network_image3
                                  ],
                                  workSpaceLocation: null,
                                  workSpaceRatnig: 3.5,
                                  address: 'My street, Egypt',
                                  workSpaceWC: true,
                                  workSpacewifi: true,
                                  rooms: <Room>[
                                    Room(
                                      roomName: 'Room 1',
                                      roomImages: [
                                        network_image1,
                                        network_image2,
                                        network_image2
                                      ], // some test images from constants file
                                      pricePerHour: 50,
                                    ),
                                    Room(
                                      roomName: 'room 2',
                                      roomImages: [
                                        network_image1,
                                        network_image2,
                                        network_image2
                                      ], // some test images from constants file
                                      pricePerHour: 50,
                                    ),
                                    Room(
                                      roomName: 'name',
                                      roomImages: [
                                        network_image1,
                                        network_image2,
                                        network_image2
                                      ], // some test images from constants file
                                      pricePerHour: 50,
                                    )
                                  ]),
                            )));
              },
            ),
            RaisedButton(
              child: Text('Event hall'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    Hall _hall = Hall(
                        name: 'Hall name',
                        category: 'Work space',
                        hallImages: [
                          network_image1,
                          network_image2,
                          network_image2
                        ],
                        // some test images from constants file
                        address: 'Egypt, Cairo, Egypatian.St',
                        location: '351.15.158',
                        rating: 2.5,
                        WC: false,
                        wifi: true);
                    Schedule hallSchedule = Schedule();
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 7), DateTime(2020, 5, 3, 9),
                        'abdallah');
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 9), DateTime(2020, 5, 3, 11),
                        'abdallah');
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 12), DateTime(2020, 5, 3, 14),
                        'abdallah');
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 15), DateTime(2020, 5, 3, 17),
                        'abdallah');
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 20), DateTime(2020, 5, 3, 21),
                        'abdallah');
                    hallSchedule.addNewReservation(
                        DateTime(2020, 5, 3, 22), DateTime(2020, 5, 3, 23),
                        'abdallah');
                    _hall.addNamedProperty(name: 'Board', value: 'Unavailable');
                    _hall.addpropertyIcon(name: Icons.kitchen, value: false);
                    _hall.schedule = hallSchedule;

                    return HallScreen(hallObj: _hall);
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
