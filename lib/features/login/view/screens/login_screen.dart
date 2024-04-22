import 'package:final_movie_app_20/core/componants/custom_text_field.dart';
import 'package:final_movie_app_20/details.dart';
import 'package:final_movie_app_20/features/home/view/manager/navigator_bar.dart';
import 'package:final_movie_app_20/features/home/view/screens/home_screen.dart';
import 'package:final_movie_app_20/features/login/view/manager/user_provider.dart';
import 'package:final_movie_app_20/features/profile/view/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/componants/custom_button.dart';
import '../../../../core/models/user_model.dart';
import '../../../register/view/screens/register_screen.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

  }

  Widget build(BuildContext context) {
     Provider.of<UserDataProvider>(context).fetchUsers();
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor:  Color(0xFF1F1F1F),
        leading: IconButton(
          icon:Icon(Icons.arrow_back,color: Color(0xFFF48D15), ),onPressed: (){
          Navigator.pop(context);
        },),),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text("Welcom to Ur Movie",style: TextStyle(color: Color(0xFFF48D15),fontWeight: FontWeight.bold,fontSize: 32),)),
                //  Center(child: Text("Enter your data",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFFF48D15),),)),
                SizedBox(height: 48,),
                Text("   Enter your Email",style: TextStyle(color: Colors.white,),),
                SizedBox(height: 5,),
                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "please enter your Email";
                    }
                    return null ;
                  },
                  controller: email,
                  hint :"Enter your  email ",),
                SizedBox(height: 24,),
                Text("   Enter your password ",style: TextStyle(color: Colors.white,),),
                SizedBox(height: 5,),
                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "please enter your password";
                    }
                    return null ;
                  },
                  obscure: true ,
                  controller: password,
                  hint: "Enter your password ",),
                SizedBox(height: 48,),
                CustomButton(
                  child: Text("Login"),
                   hight:  MediaQuery.of(context).size.height/14,
                    width: MediaQuery.of(context).size.width/12 ,
                    onPressed: (){
                      if(formkey.currentState!.validate()){
                        if(
                        Provider.of<UserDataProvider>(context,listen: false).isExist(
                            UserModel(
                                email: email.text,
                                password:  password.text,
                               ))){

                          Navigator.push(context,MaterialPageRoute(builder: (context)=>NavigationBarScreen(userEmail: email.text,)));
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Durations.long1,
                              content: Text("Not Exist Email"),
                              backgroundColor: Color(0xFFF48D15),
                            ),
                          );
                        }
                       // Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                    }


                ),
                SizedBox(height: 48,),
                Row(
                  children: [
                    Text("Don't have an account? ",style: TextStyle(color: Colors.white,),),
                    InkWell(onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen(),));
                    } ,
                      child: Text('Register Now',style: TextStyle(color: Color(0xFFF48D15)),)
                      ,),
                  ],
                )
              ],
            ),
          ),
        ),) ,
    );
  }
}


