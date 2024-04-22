import 'package:final_movie_app_20/details.dart';
import 'package:final_movie_app_20/features/login/view/screens/login_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        op = 1;
        h =100;
        w=100;
      });
    });

    super.initState();
    _navigatetoLogin();
  }
  _navigatetoLogin() async{
    await Future.delayed(
      Duration(seconds: 4),
          () {},
    );
    Navigator.pushReplacement( context, MaterialPageRoute(
        builder:
        (context)=>
            LoginScreen(),
    ));
  }

  double op = 0;
  double h = 0;
  double w = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              height: h,
              width: w,
              duration:
              Duration(
                  seconds: 3),
              child: Container(
                height:  h*0.8,
                width: w*0.8,
                child: Container(
                  child:Image.asset("assets/2.jpg",fit: BoxFit.fill) ,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(55),
                  ),),
              ),
                      ),
                  AnimatedOpacity(
                    opacity: op ,
                    duration: Duration(
                        seconds: 6),
                    child: Text("Ur Movie",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize:40),),
                  ),

          ],
        ),
      ),
    );
  }
}
