import 'package:cgroup/model/contact.dart';
import 'package:cgroup/model/img_url.dart';

class Hrsb {
  String hotelName;
  String body1;
  List<ImageUrlPath> img;
  Contact contact;
  String head;
  String body;
  String view;
  String map;

  @override
  String toString() {
    return 'Hrsb{hotelName: $hotelName, body1: $body1, img: $img, contact: $contact, head: $head, body: $body, view: $view, map: $map}';
  }

  Hrsb.en(
      {this.hotelName,
      this.body1,
      this.img,
      this.contact,
      this.head,
      this.body,
      this.view,
      this.map});
  Hrsb.ru(
      {this.hotelName,
      this.body1,
      this.img,
      this.contact,
      this.head,
      this.body,
      this.view,
      this.map});
  Hrsb.az(
      {this.hotelName,
      this.body1,
      this.img,
      this.contact,
      this.head,
      this.body,
      this.view,
      this.map});
}
