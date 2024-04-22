import 'package:final_movie_app_20/details.dart';
import 'package:final_movie_app_20/features/home/view/screens/home_screen.dart';
import 'package:final_movie_app_20/features/login/view/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/componants/custom_button.dart';
import '../../../../core/componants/custom_text_field.dart';
import '../../../../core/models/sql_helper/user_sql_helper.dart';
import '../../../../core/models/user_model.dart';
import '../../../home/view/manager/saved_movie_provider.dart';
import '../../../login/view/manager/user_provider.dart';
import '../widgets/custom_text.dart';



class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final username = TextEditingController();

  final email = TextEditingController();

  final userpassword = TextEditingController();

  final phonenumber = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDataProvider>(context).userdata;
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(backgroundColor: Color(0xFF1F1F1F),
        leading: IconButton(icon:Icon(Icons.arrow_back,color: Color(0xFFF48D15)),onPressed: (){
          Navigator.pop(context);
        },),),
      body:SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(child: Text("Welcom to Ur Movie",style: TextStyle(color: Color(0xFFF48D15),fontWeight: FontWeight.bold,fontSize: 32),)),
                Center(child: Text("Let's create an account",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Color(0xFFF48D15),),)),
                SizedBox(height: 16,),
                CustomLable(lable: 'Enter your email'),

                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "please enter your user email";
                    }
                    return null ;
                  },
                  controller: email,
                  hint :"Enter your user email ",),
                SizedBox(height: 5,),
                CustomLable(lable: 'Enter your username'),

                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "please enter your username";
                    }
                    return null ;
                  },
                  controller: username,
                  hint :"Enter your username ",),
                SizedBox(height: 5,),
                CustomLable(lable: 'Enter your password'),

                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "please enter your password";
                    }
                    return null ;
                  },
                  obscure: true ,
                  controller: userpassword,
                  hint: "Enter your  password ",),
                CustomLable(lable: 'Repeat your  password'),

                CustomTextField(
                  validator: (valu ){
                    if (valu== null || valu.isEmpty ){
                      return "Repeat your  password  ";
                    }
                    return null ;
                  },
                  obscure: true ,
                  controller: phonenumber,
                  hint: "Repeat your  password  ",),
                SizedBox(height: 40,),
                CustomButton(
                 child:  Text("Register"),
                  hight:  MediaQuery.of(context).size.height/14,
                  width: MediaQuery.of(context).size.width * 1.5 ,
                  onPressed: () async {
                    if(
                    formkey.currentState!.validate()){
                      Provider.of<UserDataProvider>(context,listen: false).addUser(
                          UserModel(
                              email: email.text,
                              password: userpassword.text,
                              ));
                    }
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));


                  },
                ),



              ],
            ),
          ),
        ),) ,
    );
  }
}



