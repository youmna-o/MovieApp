import 'package:flutter/cupertino.dart';

import '../../../../core/componants/custom_contaoiner.dart';
import '../../../../core/componants/custom_text.dart';

class CustomGenreContainer extends StatelessWidget {
  const CustomGenreContainer({
    super.key, required this.text,
  });
  final String text ;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        height: MediaQuery.of(context).size.height/20,
        width:  MediaQuery.of(context).size.width/4,
        color: Color(0xFFF48D15),
        radius: 32,
        child: Center(child: CustomText(
          text: text,
          size: 16,
        )));
  }
}