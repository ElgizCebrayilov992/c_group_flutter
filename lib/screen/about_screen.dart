import 'package:cgroup/screen/drawer_menu_screen.dart';
import 'package:cgroup/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScrenn extends StatefulWidget {
  int indexColor;
  AboutScrenn(this.indexColor);

  @override
  _AboutScrennState createState() => _AboutScrennState();
}

class _AboutScrennState extends State<AboutScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenuScreen(
        menuIndex: 5,
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("About"),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                  child: Container(
                height: 202.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/about.jpg"),
                  ),
                ),
              )),
              Positioned(
                top: 25,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Container(
                    //height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          "Resant Hotels & Resorts",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              "About us",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Text(
              """The next generation of luxury hotels in Azerbaijan!

Welcome to our Resant Hotels & Resorts!

Resant Hotels & Resorts fastest growing hotel company.

Our story, Your journey
Our company manages a group of preferred family hotels and restaurants on the Absheron peninsula and Sheki city with more than 15 years of experience in the hospitality business with the view to provide personalized and impeccable services and vacation of a difference.

OUR promise, YOUR paradise
Years of experience in the hotel industry has equipped our team with a deep understanding of the necessity and basic requirement for a perfect vacation and getaway in Azerbaijan. What we believe is: Your vacation and journey begins with the right choice you make on the type of accommodation. From there onwards, you can relax and embrace yourself for the voyage of a lifetime.

YOUR happiness and satisfaction is OUR success
Our commitment to prioritize the needs of our guests, our hotels and restaurants today stand as the most recommended and preferred properties in Azerbaijan credited by the following. This has been achieved due to our promise to build and structure our hotels in response to your needs and dreams. Through your eyes we have manage to secure:
- Personalized services
- Exotic and aesthetic decoration and design
- Competitive prices
- Friendly and easy booking services
- Quick responses

As one of the Resant Hotels & Resorts fastest growing hotel company in Azerbaijan, Resant Hotels & Resorts is committed to rapid expansion: we mean what we say and deliver what we promise. We are managing 6 hotels, 8 restaurants, 1 karaoke club and 1 beach in stunning locations in Azerbaijan.
            """,
              style: TextStyle(fontSize: 14),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Container(
              margin: EdgeInsets.all(30),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "FOLLOW US",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.facebookSquare,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.instagram,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.youtube,
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
