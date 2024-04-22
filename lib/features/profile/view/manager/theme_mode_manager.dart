import 'package:final_movie_app_20/features/profile/view/manager/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider  extends ChangeNotifier {
  Icon mode = const Icon (Icons.nightlight, size: 40,);
  ThemeData themData = darkTheme;

  void toggLeTheme() {
    if (themData == darkTheme) {
      themData = lightTheme;
      mode = const Icon(Icons.sunny, size: 40);
    } else {
      themData = darkTheme;
      mode = const Icon(Icons.nightlight, size: 40);
    }
    notifyListeners();
  }
}