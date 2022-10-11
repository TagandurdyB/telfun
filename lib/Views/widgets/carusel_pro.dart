import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '/Models/Public.dart';

class Slider_pro extends StatefulWidget {
  @override
  _Slider_proState createState() => _Slider_proState();
}

class _Slider_proState extends State<Slider_pro> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: SWi*0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(SWi*0.05),
                boxShadow: [
                  BoxShadow(color: Colors.grey,spreadRadius: 0,blurRadius: 10)
                ],
                color: Colors.transparent),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(SWi*0.05),
              child: Carousel(
                onImageChange: (i, r) {
                  setState(() {
                    _current = r;
                  });
                },
                images: [
                  Container(color: Colors.red,),
                  Container(color: Colors.green,),
                  Container(color: Colors.blue,),
                /*  NetworkImage(
                      'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
                  NetworkImage(
                      'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
                  NetworkImage(
                      'https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),*/
                ],
               /* dotSize: 6.0,
                dotSpacing: 15.0,
                dotColor: Colors.white,
                dotIncreasedColor: Color(0xff7262DF),
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.transparent,*/
                showIndicator: false,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _current,
              count: 3,
              effect: SwapEffect(
                  dotColor: Colors.white,
                  activeDotColor: Color(0xff7262DF),
                  dotWidth: 8,
                  dotHeight: 8),
            ),
          )
        ],
      ),
    );
  }
}
