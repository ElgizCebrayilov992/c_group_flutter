import 'package:cgroup/controller/hrsb_controller.dart';
import 'package:cgroup/model/hrsb.dart';
import 'package:cgroup/screen/detalis_screen.dart';
import 'package:cgroup/screen/drawer_menu_screen.dart';
import 'package:cgroup/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantsScreen extends StatefulWidget {
  int colorIndex;
  List<Hrsb> restaurant;
  RestaurantsScreen(this.restaurant, this.colorIndex);
  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  List<Hrsb> hotels = HrsbController().hotelEn();
  List<Hrsb> spa = HrsbController().spaEn();
  List<Hrsb> beach = HrsbController().beachEn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Restaurant"),
      ),
      drawer: DrawerMenuScreen(
        colorIndex: widget.colorIndex,
        menuIndex: 2,
      ),
      body: ListView(
        children: [
          buildStack(context),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Center(
              child: Text(
                "MAKE RESANT HOTELS & RESORTS YOUR HOME",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade400),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Center(
              child: Text(
                "Embark on a gastronomic journey to explore global and local cuisines at the award-winning restaurants of Resant Hotels & Resorts in Baku. From traditional Azeri cuisine to far-east Asian and modern European dishes, you will experience an exciting combination of flavors and creative culinary masterpieces across our nine signature restaurants and bars. Find out more about our new and upcoming serviced residences here.",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Text(
              "FIND A RESTAURANT",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade400),
            ),
          ),
          Column(
            children: widget.restaurant.map((e) {
              return Material(
                elevation: 5,
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(e.img[0].urlPath),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(
                          e.hotelName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        //height: 160,
                        child: Text(
                          e.body1,
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Views",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                e.view,
                                style: TextStyle(color: Colors.orangeAccent),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Row(
                            children: [
                              Text("View on Map"),
                              Icon(FontAwesomeIcons.mapMarkerAlt)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: RaisedButton(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            child: Text(
                              "View Detalis",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          onPressed: () {
                            debugPrint("SALAMMMMM  ${e}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetalisScreen(e),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget bodyPackages(List<Hrsb> list) {
    widget.restaurant.asMap().forEach((key, value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(value.img[0].urlPath),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: Text(
                    value.hotelName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  //height: 160,
                  child: Text(
                    value.body1,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: Alignment.centerLeft,
            //margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/banner2.jpg"),
                      fit: BoxFit.cover)),
            ),
          ),
        ),
        Positioned(
          child: Container(
            alignment: Alignment.centerLeft,
            //margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          left: 1,
          right: 1,
          top: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.facebook,
                        size: 15,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Facebook",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.instagram,
                        size: 15,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Instagram",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.youtube,
                        size: 15,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "Youtube",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.colorIndex = 0;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: widget.colorIndex == 0
                              ? Color.fromARGB(500, 24, 23, 99)
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Center(
                        child: Text(
                          "Az",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.colorIndex = 1;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: widget.colorIndex == 1
                              ? Color.fromARGB(500, 24, 23, 99)
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Center(
                        child: Text(
                          "En",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widget.colorIndex = 2;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: widget.colorIndex == 2
                              ? Color.fromARGB(500, 24, 23, 99)
                              : Colors.transparent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          )),
                      child: Center(
                        child: Text(
                          "Ru",
                          style:
                              TextStyle(color: Colors.white.withOpacity(0.8)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 110,
          child: Text(
            "Restaurants",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            top: 70,
            left: 95,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Restaurants",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
