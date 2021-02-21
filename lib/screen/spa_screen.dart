import 'package:cgroup/controller/hrsb_controller.dart';
import 'package:cgroup/model/hrsb.dart';
import 'package:cgroup/screen/detalis_screen.dart';
import 'package:cgroup/screen/drawer_menu_screen.dart';
import 'package:cgroup/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SPAScreen extends StatefulWidget {
  int colorIndex;
  List<Hrsb> spa;
  SPAScreen(this.spa, this.colorIndex);
  @override
  _SPAScreenState createState() => _SPAScreenState();
}

class _SPAScreenState extends State<SPAScreen> {
  List<Hrsb> hotels = HrsbController().hotelEn();
  List<Hrsb> beach = HrsbController().beachEn();
  List<Hrsb> rest = HrsbController().restaurantEn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("SPA"),
      ),
      drawer: DrawerMenuScreen(
        colorIndex: widget.colorIndex,
        menuIndex: 3,
      ),
      body: ListView(
        children: [
          buildStack(context),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Center(
              child: Text(
                "THE SPA AT RESANT & RESORTS",
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
                """
            The Spa at Resant Hotels and Resorts is a tranquil, fragrant, luxurious sanctuary of relaxation and rejuvenation. Come, experience signature therapies and techniques that are infused with Western expertise and Eastern wisdom for blissful effect. Using the curative wonders of the earth, our experienced professionals and exclusive therapies will leave your body and mind feeling wonderfully invigorated.
                """,
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
              "SPA HIGHLIGHTS",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade400),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Text(
              "SIGNATURE TREATMENTS",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Center(
              child: Text(
                """
From crushed black diamonds and Neodymium magnets to soothing Rhassoul clay from Morocco and pure Rosa Mosqueta Oil, the precious, all-natural ingredients in our products make our signature treatments even more extraordinary.
                """,
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
              "LUXURIOUS SANCTUARIES",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Center(
              child: Text(
                """Escape to a world of serenity, tranquility and gracious hospitality. The welcoming ambiance of our spas offers a unique setting for equilibrium and harmony to be restored.
                 """,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade400),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 10),
            child: Center(
              child: Text(
                "CHOOSE YOUR SANCTUARY",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade400),
              ),
            ),
          ),
          Column(
            children: widget.spa.map((e) {
              return Column(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetalisScreen(e),
                            ));
                      },
                    ),
                  ),
                ],
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  Widget bodyPackages(List<Hrsb> list) {
    widget.spa.asMap().forEach((key, value) {
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
                      image: AssetImage("assets/images/banner3.jpg"),
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
          left: 140,
          child: Text(
            "SPA",
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
            top: 70,
            left: 115,
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
                  "SPA",
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
