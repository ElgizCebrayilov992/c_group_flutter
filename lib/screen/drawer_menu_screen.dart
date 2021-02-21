import 'package:cgroup/controller/hrsb_controller.dart';
import 'package:cgroup/model/hrsb.dart';
import 'package:cgroup/screen/about_screen.dart';
import 'package:cgroup/screen/beach_screen.dart';
import 'package:cgroup/screen/contact_screen.dart';
import 'package:cgroup/screen/home_screen.dart';
import 'package:cgroup/screen/hotel_screen.dart';
import 'package:cgroup/screen/restaurants_screen.dart';
import 'package:cgroup/screen/spa_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenuScreen extends StatefulWidget {
  int colorIndex;
  int menuIndex;

  DrawerMenuScreen({this.menuIndex, this.colorIndex});

  @override
  _DrawerMenuScreenState createState() => _DrawerMenuScreenState();
}

class _DrawerMenuScreenState extends State<DrawerMenuScreen> {
  List<Hrsb> hotels = HrsbController().hotelEn();
  List<Hrsb> spa = HrsbController().spaEn();
  List<Hrsb> beach = HrsbController().beachEn();
  List<Hrsb> restaurant = HrsbController().restaurantEn();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/horlogo.png",
                  ),
                  fit: BoxFit.cover),
            ),
            accountName: Text("Resant Hotels & Resorts"),
            accountEmail: Row(
              children: [Icon(Icons.mail), Text("info@resanthotels.az")],
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(500, 24, 23, 99),
              child: ListView(
                children: [
                  InkWell(
                    splashColor: Colors.white,
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 0;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            colorIndex: widget.colorIndex,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 0 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 1;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HotelsScreen(hotels, widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 1 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.hotel,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Hotels",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 2;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestaurantsScreen(restaurant, widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 2 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.hamburger,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Restaurants",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 3;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SPAScreen(spa, widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 3 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.spa,
                          color: Colors.white,
                        ),
                        title: Text(
                          "SPA",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 4;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              BeachScreen(beach, widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 4 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.umbrellaBeach,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Beach",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 5;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AboutScrenn(widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 5 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.info,
                          color: Colors.white,
                        ),
                        title: Text(
                          "About As",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.menuIndex = 6;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ContactScreen(widget.colorIndex),
                        ),
                      );
                    },
                    child: Container(
                      color: widget.menuIndex == 6 ? Colors.grey : null,
                      child: ListTile(
                        leading: Icon(
                          FontAwesomeIcons.addressBook,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Contact",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
