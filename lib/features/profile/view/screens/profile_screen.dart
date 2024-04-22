import 'package:final_movie_app_20/core/models/sql_helper/user_sql_helper.dart';
import 'package:final_movie_app_20/features/login/view/manager/user_provider.dart';
import 'package:final_movie_app_20/features/profile/view/manager/theme_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:theme_mode_handler/theme_mode_handler.dart';

import '../manager/theme_mode_manager.dart';
import '../widgets/setting_options.dart';


class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key, required this.userEmail, }) : super(key: key);
   late final String userEmail ;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
 ThemeData themeData = lightTheme ;

class _ProfileScreenState extends State<ProfileScreen> {

  bool status = true ;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scaffold(
         //   backgroundColor:  Color(0xFF1F1F1F),
      // FutureBuilder(
        //  future: UserProvider.instance.getAllUsers(),
       //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        //    if(snapshot.hasData){
         //     print(snapshot.data.last.username);

        body:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16,left: 8),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/2.jpg"),
                          ),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width/20),
                      Padding(
                        padding: const EdgeInsets.only(top: 50,),
                        child: Column(
                          children: [
                            Text("",style: TextStyle(fontSize: 20),),
                            Text("${widget.userEmail}"),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SettingOptions(),
              ],
            ),
          ),
        ),
        /* SingleChildScrollView(
         scrollDirection: Axis.vertical,
          physics: ClampingScrollPhysics(),
          child: Expanded(
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Container(
                      color: Colors.red,
                      height:  MediaQuery.of(context).size.height/6,
                      width: MediaQuery.of(context).size.width ,
                      child: Row
                        (children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                          },
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: AssetImage("assets/2.jpg"),
                          ),
                        ),
                      ],),
                    ),
                  ),

                  SettingOptions(),
                ],
              ),
            ),
          ),

        ),*/
      ),
    );
  }
}



