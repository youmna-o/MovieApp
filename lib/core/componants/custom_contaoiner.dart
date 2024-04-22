import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomContainer extends StatelessWidget {
   CustomContainer({
    super.key,
     this.height= 0,
     this.width = 0 ,
     this.radius = 0 ,
    required this.child,
      this.color = Colors.transparent ,
  });
  final double height;
  final double width;
  final Widget child ;
  final  Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: child,
      decoration: BoxDecoration(color: color,
      borderRadius:BorderRadius.circular(radius),
      ),

    );
  }
}