import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
     this.color = Colors.white,
     this.font_Weight = FontWeight.w300,
    required this.size,

  });
  final String text ;
  final Color color ;
  final FontWeight font_Weight ;
  final double size ;
  @override
  Widget build(BuildContext context) {
    return Text(" ${text}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: font_Weight),
    );
  }
}