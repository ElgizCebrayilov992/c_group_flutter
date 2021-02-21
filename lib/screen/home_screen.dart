import 'package:cgroup/controller/brend_controller.dart';
import 'package:cgroup/controller/guest_reviews_controller.dart';
import 'package:cgroup/controller/hrsb_controller.dart';
import 'package:cgroup/controller/our_awesome_services.dart';
import 'package:cgroup/model/guest_reviews.dart';
import 'package:cgroup/model/hrsb.dart';
import 'package:cgroup/model/img_url.dart';
import 'package:cgroup/screen/detalis_screen.dart';
import 'package:cgroup/screen/drawer_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  int colorIndex;
  HomeScreen({this.colorIndex = 0});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Hrsb> restaurant;
  List<Hrsb> spa;
  List<Hrsb> beach;
  List<Hrsb> allRss;
  List<Hrsb> hotels;

  List<String> ourPack = ["All", "Hotels", "Restaurants", "SPA", "Beach"];
  int ourPackages = 0;
  int _current = 0;
  int _ourAwesomeServicesIndex = 0;
  int _ourBrandsIndex = 0;
  int _left = 1;
  int _right = 3;
  int _cent = 2;

  int _screenSelected = 0;

  String searchAddress;

  List<OurAwesomeServiceControl> fonts;
  String hotelName = "";
  @override
  void initState() {
    // TODO: implement initState
    //  widget.colorIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DrawerMenuScreen(
      menuIndex: 0,
    );
    hotels = HrsbController().hotelEn();
    spa = HrsbController().spaEn();
    beach = HrsbController().beachEn();
    restaurant = HrsbController().restaurantEn();
    List<ImageUrlPath> ourBrendList = BrendController().brendImages();
    List<OurAwesomeServiceControl> fonts = OurAwesome().serviceControl();

    return Scaffold(
      drawer: DrawerMenuScreen(
        menuIndex: 0,
        colorIndex: widget.colorIndex,
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text("Resant Hotels & Resorts"),
      ),

      // backgroundColor: Colors.grey.shade400,
      body: ListView(
        children: [
          swiperHead(context),
          SizedBox(
            height: 10,
          ),
          writerScreen(s1: "Top", s2: "Sightseeing"),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              "By visiting our places, you can learn about our historical "
              "monuments and discover interesting places",
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
            ),
          ),
          topSightseeingALtBody(context),
          SizedBox(
            height: 20,
          ),
          writerScreen(s1: "Our", s2: "Awesome Services"),
          ourAwesomeServicesFont(context, fonts),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                image:
                    DecorationImage(image: AssetImage("assets/images/wl.jpg"))),
          ),
          SizedBox(
            height: 20,
          ),
          writerScreen(s1: "Browse  ", s2: "Our Packages"),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            height: 25,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: ourPack.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          ourPackages = index;
                          debugPrint("AAAA: $ourPackages");
                          fontAll();
                        });
                      },
                      child: Center(
                        child: Container(
                          margin: EdgeInsets.all(2),
                          child: Text(
                            ourPack[index],
                            style: TextStyle(
                                color: ourPackages == index
                                    ? Colors.black
                                    : Colors.grey,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    index != 4
                        ? Text(
                            "|",
                            style: TextStyle(color: Colors.grey),
                          )
                        : Text(""),
                  ],
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: fontAll(),
          ),
//          Container(
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.circular(10),
//            ),
//            height: 200,
//            width: 100,
//            child: fontAll(),
//          ),
          SizedBox(
            height: 20,
          ),
          writerScreen(s1: "Our ", s2: "Brands"),
          ourBrands(context, ourBrendList),
          SizedBox(
            height: 20,
          ),
          writerScreen(s1: "Guest ", s2: "Reviews"),
          guestFont(context),

//
        ],
      ),
    );
  }

  Column guestFont(BuildContext context) {
    List<GuestReviews> guestList = GuestReviewsController().guestList();
    return Column(
      children: [
        //center
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    debugPrint("Baslangic: R: $_right   C: $_cent   L: $_left");
                    _cent--;

                    if (_cent < 0) {
                      _cent = 4;
                    }

                    switch (_cent) {
                      case 0:
                        _left = 4;
                        _right = 1;
                        break;
                      case 1:
                        _left = 0;
                        _right = 2;
                        break;
                      case 2:
                        _left = 1;
                        _right = 3;
                        break;
                      case 3:
                        _left = 2;
                        _right = 4;
                        break;
                      case 4:
                        _left = 3;
                        _right = 0;
                        break;
                    }

                    debugPrint("R: $_right   C: $_cent   L: $_left");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.indigo,
                    size: 40,
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                        image: AssetImage(guestList[_left].profilImage.urlPath),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                        image: AssetImage(guestList[_cent].profilImage.urlPath),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    image: DecorationImage(
                        image:
                            AssetImage(guestList[_right].profilImage.urlPath),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    debugPrint("Baslangic: R: $_right   C: $_cent   L: $_left");
                    _cent++;

                    if (_cent == 5) {
                      _cent = 0;
                    }
                    switch (_cent) {
                      case 0:
                        _left = 4;
                        _right = 1;
                        break;
                      case 1:
                        _left = 0;
                        _right = 2;
                        break;
                      case 2:
                        _left = 1;
                        _right = 3;
                        break;
                      case 3:
                        _left = 2;
                        _right = 4;
                        break;
                      case 4:
                        _left = 3;
                        _right = 0;
                        break;
                    }

                    debugPrint("R: $_right   C: $_cent   L: $_left");
                  });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.indigo,
                    size: 40,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Text(
                guestList[_cent].name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  guestList[_cent].messages,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container ourBrands(BuildContext context, List<ImageUrlPath> brend) {
    return Container(
      color: Colors.grey.shade300,
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        autoplayDisableOnInteraction: true,
        control: SwiperPagination(
          builder: new DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Colors.blue),
        ),
        onTap: (index) {},
        onIndexChanged: (value) {
          setState(() {
            _ourBrandsIndex = value;
          });
        },
        autoplay: true,
        layout: SwiperLayout.DEFAULT,
        itemCount: brend.length,
        itemBuilder: (context, index) {
          ImageUrlPath font = brend[index];
          return Container(
            height: 100,
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage(font.urlPath), fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }

  List<Widget> fontAll() {
    hotels = HrsbController().hotelEn();
    allRss = HrsbController().AllEn();
    restaurant = HrsbController().restaurantEn();
    spa = HrsbController().spaEn();
    beach = HrsbController().beachEn();

//    for (var i = 0; i < spa.length; i++) {
//      allRss = [spa[i]];
//    }
//    for (var i = 0; i < beach.length; i++) {
//      allRss = [beach[i]];
//    }

    switch (ourPackages) {
      case 0:
        return bodyPackages(allRss);
      case 1:
        return bodyPackages(hotels);
      case 2:
        return bodyPackages(restaurant);
      case 3:
        return bodyPackages(spa);
      case 4:
        return bodyPackages(beach);
    }
  }

  List<Widget> bodyPackages(List<Hrsb> list) {
    return list.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetalisScreen(e),
              ));
        },
        child: Container(
          margin: EdgeInsets.only(right: 5, bottom: 5, left: 5),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: AssetImage(e.img[0].urlPath), fit: BoxFit.fill),
          ),
          child: Center(
            child: Text(
              e.hotelName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      );
    }).toList();
  }

/*
* Container(
      margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetalisScreen(list[index]),
                  ));
              debugPrint("${list[index].hotelName}");
            },
            child: Container(
              //  padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
              margin: EdgeInsets.only(right: 5, bottom: 5),
              height: 200,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(list[index].img[0].urlPath),
                    fit: BoxFit.fill),
              ),
              child: Center(
                child: Text(
                  list[index].hotelName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
    );
* */
  Row topSightseeingALtBody(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si1.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 200,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Maiden Tower",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "The Maiden Tower, which presents the story of historic evolution of the Baku city. It also has a gift shop",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si4.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si6.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gobustan National Park",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gobustan occupies the south-eastern spur of the Great Caucasian Range and situated 60 km south of Baku",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  right: 10,
                  left: 10,
                ),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si2.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si3.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: AssetImage("assets/images/sightseeing/si5.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 180,
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "The Palace of Shaki Khans",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Palace of Shaki Khans in Shaki, Azerbaijan was a summer residence for the Shaki Khans. It was built in 1797 by Muhammed Hasan Khan.The summer residence is renowned for the lavish decoration of its exterior and interior",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Stack swiperHead(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Swiper(
              autoplayDisableOnInteraction: true,
              control: SwiperPagination(
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.blue),
              ),
              onTap: (index) {
                debugPrint("${hotels[index].hotelName}");
              },
              onIndexChanged: (value) {
                setState(() {
                  _current = value;
                });
              },
              autoplay: true,
              layout: SwiperLayout.DEFAULT,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                Hrsb hotel = hotels[index];
                hotelName = hotel.hotelName;
                return Container(
                  decoration: BoxDecoration(
                    //  borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: AssetImage(hotel.img[0].urlPath),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          child: Center(
                        child: Text(
                          hotelName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                );
              },
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
//        Positioned(
//          bottom: 60,
//          left: 60,
//          right: 60,
//          top: 60,
//          child:
//        ),
      ],
    );
  }

  Container ourAwesomeServicesFont(
      BuildContext context, List<OurAwesomeServiceControl> fonts) {
    return Container(
      color: Colors.grey.shade300,
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Swiper(
        autoplayDisableOnInteraction: true,
        control: SwiperPagination(
          builder: new DotSwiperPaginationBuilder(
              color: Colors.grey, activeColor: Colors.blue),
        ),
        onTap: (index) {},
        onIndexChanged: (value) {
          setState(() {
            _ourAwesomeServicesIndex = value;
          });
        },
        autoplay: true,
        layout: SwiperLayout.DEFAULT,
        itemCount: fonts.length,
        itemBuilder: (context, index) {
          OurAwesomeServiceControl font = fonts[index];
          return Container(
            decoration: BoxDecoration(
              //  borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage("assets/images/gr1.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    font.icon,
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      font.head,
                      style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      font.body,
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 2,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  writerScreen({String s1, String s2}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      //   padding: EdgeInsets.only(top: 15),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              s1,
              style: TextStyle(color: Colors.grey, fontSize: 30),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              s2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

/*
*
* */
