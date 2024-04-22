import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomLable extends StatelessWidget {
  const CustomLable({
    super.key, required this.lable,
  });
  final String lable ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text("${lable}",style: TextStyle(fontSize:12,color: Colors.white),),
    );
  }
}
