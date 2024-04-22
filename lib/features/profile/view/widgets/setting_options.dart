import 'package:final_movie_app_20/features/login/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../../../login/view/manager/user_provider.dart';
import '../manager/theme_mode_manager.dart';
import 'custom_setting_item.dart';
import 'custom_space.dart';

class SettingOptions extends StatefulWidget {
  const SettingOptions({
    super.key,
  });

  @override
  State<SettingOptions> createState() => _SettingOptionsState();
}

class _SettingOptionsState extends State<SettingOptions> {
  bool status = true ;
  @override
  Widget build(BuildContext context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),

          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Icon(Icons.dark_mode_outlined,color: Color(0xFFF48D15)),
                    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
                    Text("Light Mode",style: TextStyle(fontSize: 10,color:Color(0xFFF48D15,)),),
                  ],),
                  Container(
                    height: 30,
                    child:
                    Consumer<ThemeProvider>(
                        builder: (context, themeProvider, child) {
                          return FlutterSwitch(
                            width: MediaQuery.of(context).size.height * 0.08,
                            height: MediaQuery.of(context).size.height * 0.04,
                            valueFontSize: 16,
                            toggleSize: 16,
                            borderRadius: 20.0,
                            padding: 8.0,
                            //showOnOff: true,
                            activeColor: Colors.black,
                            inactiveColor:Color(0xFFF48D15),
                            value:status ,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                                themeProvider.toggLeTheme();
                              });
                            },
                          );}
                    ),
                  ),

                ],
              ),
              CustomSpace(),

              CustomSettingItem(
                icon: Icons.language,
                title: "Language",
                onPressed: (){
                },
              ),
              CustomSpace(),

              CustomSettingItem(
                icon: Icons.notifications,
                title: "Notifications",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.info,
                title: "Info",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.edit,
                title: "Edit Profile",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.contact_phone,
                title: "Contact Us",
                onPressed: (){},
              ),
              CustomSpace(),
              CustomSettingItem(
                icon: Icons.logout,
                title: "Logout",
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
              ),


            ],
          ),
        ),
      );
  }
}