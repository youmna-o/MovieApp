import 'package:final_movie_app_20/core/models/sql_helper/user_sql_helper.dart';
import 'package:final_movie_app_20/details.dart';
import 'package:final_movie_app_20/features/home/view/manager/navigator_bar.dart';
import 'package:final_movie_app_20/features/home/view/manager/saved_movie_provider.dart';
import 'package:final_movie_app_20/features/login/view/manager/user_provider.dart';
import 'package:final_movie_app_20/features/profile/view/manager/theme_const.dart';
import 'package:final_movie_app_20/features/profile/view/manager/theme_mode_manager.dart';
import 'package:final_movie_app_20/features/profile/view/screens/profile_screen.dart';
import 'package:final_movie_app_20/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import 'core/models/sql_helper/save_movie_sql_helper.dart';
import 'features/login/view/screens/login_screen.dart';
import 'features/splash/view/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SaveMovieSqlHelper.instance.open();
  UsersSQLHelper.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserDataProvider(),),
        ChangeNotifierProvider(create: (context) => SavedMovieProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
      ],

      child:
      Consumer<ThemeProvider>(
        builder: (context , themeProvider , child){
          return  MaterialApp(
            theme: Provider.of<ThemeProvider>(context).themData,
            debugShowCheckedModeBanner: false,
            home: //SearchScreen(),
            //DetailsScreen(),
            SplashScreen(),
           // LoginScreen(),
          );
        },

      ),
    );
  }
}

          //DetailsScreen(),
         // SearchScreen(),
         // NavigationBarScreen(),
        //SplashScreen(),
       // LoginScreen(),
          //Home(),
        //Trailer(),
        //HomeScreen(),



