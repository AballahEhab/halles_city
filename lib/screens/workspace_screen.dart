import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:halls_city/UI_componants/circle_tab_indicator.dart';
import 'package:halls_city/UI_componants/get_netWork_image.dart';
import 'package:halls_city/UI_componants/hall_properties.dart';
import 'package:halls_city/models/workspace.dart';
import 'package:halls_city/screens/room_screen.dart';

import '../constants.dart' as constant;


class WorkSpaceScreen extends StatefulWidget {

  WorkSpace workSpace;

  WorkSpaceScreen({this.workSpace});

  @override
  _WorkSpaceScreenState createState() => _WorkSpaceScreenState();
}

class _WorkSpaceScreenState extends State<WorkSpaceScreen>
    with SingleTickerProviderStateMixin {

  // declaring tab control because we will not use [defualTabControler] widget
  TabController _tabController;

  // declaring a scroll view controller to use it for [NestedScrollView]
  ScrollController _scrollViewController;

  @override
  void initState() {
    super.initState();

    //initializing the two controllers
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    //dispose the two controllers before disposing the screen
    _tabController.dispose();
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // to prevent the app from overriding on notification bar
    return SafeArea(
      // the largest widget of material app which contains all other widgets
      child: Scaffold(
        backgroundColor: constant.light_gray_color,
        body: NestedScrollView(
          controller: _scrollViewController,
          headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
            return <Widget>[
              // creating a sliver app bar to make it scrollable
              SliverAppBar(
                //setting the app bar float means only tab bar will be pinned
                floating: true,
                pinned: true,
                // initializing the height of the app bar
                expandedHeight: 279,
                // back button icon
                leading: IconButton(
                  icon: constant.back_icon,
                  onPressed: () {
                    //
                    Navigator.pop(context);
                  },
                ),
                // adding the workspace images inside carousel
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(bottom: 47.0),
                    child: CarouselSlider.builder(
                      viewportFraction: 1.0,
                      autoPlay: true,
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int itemIndex) {
                        return Image(
                          //testig the carousel with more than an image
                          image: itemIndex == 0
                              ? constant.network_image2
                              : constant.network_image1,
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
                // changing the app bar color to the gray color of the app
                backgroundColor: constant.light_gray_color,
                bottom: TabBar(
                  unselectedLabelColor: Colors.blueGrey,
                  labelColor: constant.main_dark_color,
                  indicator: CircleTabIndicator(
                      color: constant.main_light_color, radius: 3),
                  labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                  ),
                  unselectedLabelStyle: TextStyle(
                      fontSize: 15
                  ),
                  tabs: <Widget>[
                    Tab(
                      text: 'Details',
                    ),
                    Tab(
                      text: 'Rooms',
                    ),
                  ],
                  controller: _tabController,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: constant.all_sides_padding,
                child: ClipRRect(
                  borderRadius: constant.circularBorder,
                  child: Container(
                    color: constant.card_backgrund,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 27.0,
                                backgroundImage: constant.network_image1,
                                backgroundColor: Colors.transparent,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, left: 8),
                                    child: Text(
                                      widget.workSpace.placeName,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, top: 6),
                                    child: Text(widget.workSpace.category),
                                  )
                                ],
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on,
                                  color: constant.main_dark_color,
                                  size: 42.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: <Widget>[
                              ...widget.workSpace.getPropertyIcons(),
                              Expanded(
                                child: Container(),
                              ),
                              Padding(
                                padding: constant.all_sides_padding,
                                child: HallProperties.customRateBar(
                                    rate: widget.workSpace.rating
                                ),
                              ),
                            ],
                          ),
                        ),
                        constant.custom_divider,
                        ...widget.workSpace.getNamedProperties(),
                      ],
                    ),
                  ),
                ),
              ),
              GridView.builder(
                  itemCount: widget.workSpace.rooms.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: GetNetworkImage(
                                        image: widget.workSpace.rooms[index]
                                            .images[0],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ])),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        widget.workSpace.rooms[index].placeName,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 23),
                                      ),
                                      Text(
                                        '${widget.workSpace.rooms[index]
                                            .namedProperty['Price per hour']}\$/hr',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) =>
                              RoomScreen(
                                  currentRoom: widget.workSpace.rooms[index]
                              )));
                        },
                      );
                  }),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }


}