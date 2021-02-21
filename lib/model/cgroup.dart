import 'package:cgroup/model/social.dart';

class CGroup {
  String name;
  String mail;
  String web;
  List<String> phone;
  List<Social> social;
  String about;
  String imgPath;

  CGroup.en(
      {this.name,
      this.mail,
      this.web,
      this.phone,
      this.social,
      this.about,
      this.imgPath});
  CGroup.az(
      {this.name,
      this.mail,
      this.web,
      this.phone,
      this.social,
      this.about,
      this.imgPath});
  CGroup.ru(
      {this.name,
      this.mail,
      this.web,
      this.phone,
      this.social,
      this.about,
      this.imgPath});
}
