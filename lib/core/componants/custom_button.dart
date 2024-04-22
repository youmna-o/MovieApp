import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onPressed,
    required this.width,
    required this.hight
    ,required this.child,
    super.key,
  });
  final void Function()? onPressed;
  final double width;
  final double hight;
  final Widget child ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ,
      height: hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(16),
        color: Color(0xFFF48D15),),


      child: MaterialButton(
        onPressed: onPressed,
        child: child
          ),
    );
  }
}
