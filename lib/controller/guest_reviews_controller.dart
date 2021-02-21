import 'package:cgroup/model/guest_reviews.dart';
import 'package:cgroup/model/img_url.dart';

class GuestReviewsController {
  List<GuestReviews> guestList() {
    List<GuestReviews> list = [
      GuestReviews(
        name: "delishnaz",
        messages: """
      This hotel was so dreamy and uniqe.the rooms has been decorated so luxury.staff were so friendly & polite.it was very clean and organized.the price of food was cheaper than resturant in the city.and had good quality.you can use turkish bath as free facility.wifi was so weak at the day we arrived with some problems maybe they fixed it after.location is best part you can go around by walking is so close to historical sights.totally it was very good and chic.if you interseted in botique hotel it is one of the best. 
      """,
        profilImage: ImageUrlPath(urlPath: "assets/images/guest/gs1.jpg"),
      ),
      GuestReviews(
        name: "Stefanos2008",
        messages: """
     Our group (16 pax from US, Europe, Australia) had a memorable stay at the hotel. The location in the charming old town of Baku is perfect: nice restaurants, lots of shops and two Museums are all there. The hotel is quiet, clean and confortable. The staff extremely commited to help the tourists. The breakfats on the terrace restaurant is so lovely with the view on the old town and the sea. All the major attraction of Baku are within wakable distance. Next door to the hotel a good exchange office open untill late night.&nbsp;
      """,
        profilImage: ImageUrlPath(urlPath: "assets/images/guest/gs2.jpg"),
      ),
      GuestReviews(
        name: "natter1327",
        messages: """
     We loved this hotel! It was in a PERFECT location right in the Old City, but close enough to walk to Fountain Square and the Bulvar. The hotel was clean, had a wonderful and plentiful breakfast, fast and free Wifi, very friendly and helpful staff, and the room was large. We had seen complaints of the noise (and I am very sensitive to that), but we didn't have any issues. Just make sure the windows are closed. Overall, I would highly suggest the Shah Palace and Baku as well! Both exceeded my expectations!
      """,
        profilImage: ImageUrlPath(urlPath: "assets/images/guest/gs3.jpg"),
      ),
      GuestReviews(
        name: "Doctimes",
        messages: """
    The hotel is right in the middle of Old Town and close to the city center. This made it very easy to walk around. The staff was very friendly and the free breakfast was incredible, so much good food. There is a restaurant at the hotel and the food is very good. The combination of modern and classical look is amazing.  Overall, I would recommend this hotel to everyone visiting Baku.
     """,
        profilImage: ImageUrlPath(urlPath: "assets/images/guest/gs4.jpg"),
      ),
      GuestReviews(
        name: "cfq_11",
        messages: """
    I stayed here for 4 nights on a recent visit to Baku. I found the location to be second to none. Easy walking distance to all the sites in Baku. My room was located in the front of the building overlooking the main street. My room was very opulent, clean and large.  The buffet breakfast was varied and the wait staff very friendly. 
    """,
        profilImage: ImageUrlPath(urlPath: "assets/images/guest/gs5.jpg"),
      ),
    ];
    return list;
  }
}
