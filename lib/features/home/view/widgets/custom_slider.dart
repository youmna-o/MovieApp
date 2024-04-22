import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

List<String> posters = [
  "assets/00.jpg",
  'assets/11.jpeg',
  'assets/222.jpeg',
  'assets/10.jpeg',
  'assets/33.jpeg',
  'assets/88.jpeg',
  'assets/11111.jpeg',
  'assets/55.jpeg',
  'assets/66.jpeg',
  'assets/9.jpeg',
  'assets/444.jpg',
  'assets/122.jpeg',
  'assets/13.jpeg',

];

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key,});

  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
      items: [
        for(String i in posters)
          Image.asset("${i}"),
        // Container(color: Colors.red,),
      ],
      options: CarouselOptions(
        height:  MediaQuery.of(context).size.height*0.3,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 2),
        enlargeCenterPage: true,
        enlargeFactor: 0.45,
        viewportFraction: 0.5,
       // aspectRatio: 1.0,
        //initialPage: 2,
      ),

    );
  }
}

