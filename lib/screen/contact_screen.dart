import 'package:cgroup/screen/drawer_menu_screen.dart';
import 'package:cgroup/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatefulWidget {
  int colorIndex;
  ContactScreen(this.colorIndex);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenuScreen(
        menuIndex: 6,
        colorIndex: widget.colorIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Contact"),
      ),
      body: ListView(
        children: [
          buildStack(context),
          Container(
            margin: EdgeInsets.only(right: 20, left: 20, top: 20),
            child: Center(
              child: Text(
                "          WE WOULD LIKE TO HEAR FROM YOU! HERE ARE A FEW WAYS "
                "       TO GET IN TOUCH WITH US.",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              right: 20,
              left: 20,
              top: 10,
            ),
            child: Text(
              "For room reservations, please book online resanthotels.az or email info@resanthotels.az. You may also contact us on any of the toll free or international direct dial numbers below: +994 55 254 05 48",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Column(
            children: [
              adressBody(
                  "Our Address",
                  "+994(55) 254-05-48 \n+994(55) 300-33-64",
                  "Ashiq Molla Cuma str., Baku, Azerbaijan",
                  "info@resanthotels.az",
                  "www.resanthotels.az"),
              adressBody(
                  "Rich Hotel",
                  "+994 55 214 34 80",
                  "Alasgar Gayibov str.3. Baku, Azerbaijan",
                  "sales@richhotel.az",
                  "www.resanthotels.az"),
              adressBody(
                  "Shah Palace Hotel",
                  "+994 50 234 82 82",
                  "Qosha Qala str.47. Baku, Azerbaijan",
                  "sales@shahpalace.az",
                  "www.resanthotels.az"),
              adressBody(
                  "Ramada by Wyndham",
                  "+994 12 491 73 03",
                  "Shikhov Beach. Baku, Azerbaijan",
                  "sales@ramadabaku.com",
                  "www.resanthotels.az"),
              adressBody(
                  "Sheki Palace Hotel",
                  "+994 55 455 05 37",
                  "Akhundzada Avenue. Sheki, Azerbaijan",
                  "sales@shekipalace.az",
                  "www.resanthotels.az"),
              adressBody(
                  "Theatrum Hotel",
                  "+994 12 525 55 25",
                  "Street of Mardanov Brothers. Baku, Azerbaijan",
                  "sales@theatrumhotel.az",
                  "www.resanthotels.az"),
              adressBody(
                  "Promenade Hotel",
                  "+994 12 525 55 00",
                  "Neftchilar avenue 9-13. Baku, Azerbaijan",
                  "sales@promenadehotel.az",
                  "www.resanthotels.az"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "For media & development",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "For development queries, please email info@resanthotels.az or contact us on the below mailing address:",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.phone,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "+994(55) 254-05-48 \n+994(55) 300-33-64",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.planeDeparture,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Ashiq Molla Cuma str., Baku, Azerbaijan",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
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
                      image: AssetImage("assets/images/contact.jpg"),
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
            "Contact",
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
                  "Contact",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            )),
      ],
    );
  }

  adressBody(
      String head, String nomre, String adress, String mail, String web) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            head,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.phone,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                nomre,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.planeDeparture,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                adress,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.envelope,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                mail,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                FontAwesomeIcons.tv,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                web,
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ],
      ),
    );
  }
}
