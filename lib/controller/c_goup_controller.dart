import 'package:cgroup/model/cgroup.dart';
import 'package:cgroup/model/social.dart';

class CGropuController {
  final Social fb =
      Social(name: 'facebook', url: 'https://www.facebook.com/Resanthotels/');
  final Social ins = Social(
      name: 'instagram', url: 'https://www.instagram.com/resantgrouphotels');
  final Social yb = Social(
      name: 'youtube',
      url: 'https://www.youtube.com/channel/UCf3T1d_G3h3B1SKj5QSKw-A/featured');
  List<Social> list = List<Social>();

  CGroup cGroup() {
    final Social fb =
        Social(name: 'facebook', url: 'https://www.facebook.com/Resanthotels/');
    final Social ins = Social(
        name: 'instagram', url: 'https://www.instagram.com/resantgrouphotels');
    final Social yb = Social(
        name: 'youtube',
        url:
            'https://www.youtube.com/channel/UCf3T1d_G3h3B1SKj5QSKw-A/featured');
    List<Social> list = List<Social>();
    list.add(fb);
    list.add(ins);
    list.add(yb);
    final CGroup cGroupEn = CGroup.en(
        name: "C-Group",
        about: """
  The next generation of luxury hotels in Azerbaijan!

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
        imgPath: "assets/images/about.jpg",
        mail: 'info@resanthotels.az',
        phone: ['+994(55) 254-05-48', '+994(55) 300-33-64'],
        social: list,
        web: 'c-group.az');

    return cGroupEn;
  }
}
