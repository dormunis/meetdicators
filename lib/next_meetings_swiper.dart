import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NextMeetingsSwiper extends StatefulWidget {
  @override
  _NextMeetingsSwiperState createState() => new _NextMeetingsSwiperState();
}

class _NextMeetingsSwiperState extends State<NextMeetingsSwiper> {
  @override
  Widget build(BuildContext context) {
    return
      new Swiper(
        itemBuilder: (BuildContext context, int index) {
//              return Text("Hellooooo World",
//                  textDirection: TextDirection.ltr,
//                  style: TextStyle(
//                      fontSize: 40,
//                      color: Colors.black87,
//                      fontFamily: 'Khand',
//                      fontWeight: FontWeight.bold));
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),
      );
  }
}
