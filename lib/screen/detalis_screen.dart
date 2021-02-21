import 'package:cgroup/model/hrsb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetalisScreen extends StatefulWidget {
  Hrsb detay;
  DetalisScreen(this.detay);
  @override
  _DetalisScreenState createState() => _DetalisScreenState();
}

class _DetalisScreenState extends State<DetalisScreen> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text(widget.detay.hotelName),
      ),
      body: ListView(
        children: [
//          Center(
//            child: Text(
//              widget.detay.hotelName,
//              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//            ),
//          ),
//          SizedBox(
//            height: 10,
//          ),
          swiperHead(context),
          Container(
            margin: EdgeInsets.all(5),
            child: Text(widget.detay.body),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Text(
              widget.detay.contact.head,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey.withOpacity(0.3)),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Address : ",
                    ),
                    Expanded(
                      child: Text(
                        widget.detay.contact.address,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Phone  : ",
                    ),
                    Text(
                      "${widget.detay.contact.phone[0]} ;${widget.detay.contact.phone[1]}",
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Mail  : ",
                    ),
                    Text(
                      widget.detay.contact.mail,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Web   : ",
                    ),
                    Text(
                      widget.detay.contact.web,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  swiperHead(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            alignment: Alignment.centerLeft,
            //margin: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  child: Swiper(
                    autoplayDisableOnInteraction: true,
                    control: SwiperPagination(
                      builder: new DotSwiperPaginationBuilder(
                          color: Colors.grey, activeColor: Colors.blue),
                    ),
                    onTap: (index) {},
                    onIndexChanged: (value) {
                      setState(() {
                        _current = value;
                      });
                    },
                    autoplay: true,
                    layout: SwiperLayout.DEFAULT,
                    itemCount: widget.detay.img.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          //  borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image:
                                  AssetImage(widget.detay.img[index].urlPath),
                              fit: BoxFit.cover),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
