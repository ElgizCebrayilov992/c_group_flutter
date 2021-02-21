import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OurAwesomeServiceControl {
  Icon icon;
  String head;
  String body;

  OurAwesomeServiceControl.named(this.icon, this.head, this.body);
}

class OurAwesome {
  List<OurAwesomeServiceControl> serviceControl() {
    List<OurAwesomeServiceControl> list = [
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.hotel,
            size: 60,
            color: Colors.grey,
          ),
          "Luxury Hotels",
          'Luxury and modern style hotels.'),
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.map,
            size: 60,
            color: Colors.grey,
          ),
          "City Map",
          'General map for a comfortable tour of the city.'),
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.car,
            size: 60,
            color: Colors.grey,
          ),
          "City Tours",
          "Pissibility to visit the most beautiful and different places of our city."),
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.pizzaSlice,
            size: 60,
            color: Colors.grey,
          ),
          "Delicious Food",
          "The most beautiful sample foreign and national cuisine."),
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.carSide,
            size: 60,
            color: Colors.grey,
          ),
          "Free Transfer",
          "Airport pick up - drop off."),
      OurAwesomeServiceControl.named(
          Icon(
            FontAwesomeIcons.shieldAlt,
            size: 60,
            color: Colors.grey,
          ),
          "High Security",
          "To make your trip safer and more secure."),
    ];
    return list;
  }
}
