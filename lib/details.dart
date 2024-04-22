
import 'package:flutter/material.dart';
import 'core/componants/custom_contaoiner.dart';
import 'core/componants/custom_text.dart';


class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {


  void initState(){
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F1F1F),
      body:CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height*0.6,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("assets/2.jpg",
                width: double.infinity,
                fit: BoxFit.cover,),
            ),
            toolbarHeight: MediaQuery.of(context).size.height*0.1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){}, icon: Icon(Icons.arrow_back),),
                IconButton(
                  onPressed: (){}, icon: Icon(Icons.bookmark_add),),
              ],
            ),
            bottom: PreferredSize(
                preferredSize:Size.fromHeight(MediaQuery.of(context).size.height*0.01),
              child: Container(
                      decoration: BoxDecoration(
                          color:  Color(0xFF1F1F1F).withOpacity(0.5),
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)) ),
                    width: double.maxFinite,
                    padding: EdgeInsets.only(top: 4,bottom: 8,left: 16),

                    child: CustomText(text: "cvfbnnb",
                    color: Colors.white,
                    font_Weight: FontWeight.w500,
                    size: 24,)),
            ),

          ),
          SliverToBoxAdapter(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star,color:Color(0xFFFAE315),size: 20,),
                        CustomText(
                          text: "80",
                          color:Color(0xFFFAE315),
                          size: 16,
                          font_Weight: FontWeight.bold,

                      )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                            height: MediaQuery.of(context).size.height/18,
                            width:  MediaQuery.of(context).size.width*0.65,
                            color:Colors.transparent ,
                                child: CustomText(
                                  color: Colors.white,
                                  size: 24,
                                  font_Weight: FontWeight.w300,
                                  text: "The mauui",
                                  )

                        ),
                        Container(
                          height: MediaQuery.of(context).size.height/20,
                          width:  MediaQuery.of(context).size.width/6,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(50) ),
                          child:Center(child: Text("2024",style: TextStyle(color:Colors.white,fontSize: 16,),)),
                        ),
                      ],
                    ),
                    Text(
                       "ou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programmingou will learn how to use flutter sliverappbar, customscrollview and"
    " slivertoboxadapter. We will use them all in one. CustomScrollView takes slivers"
    " as a list. And lists take slivers. Slivers are scrollable special widgetsLearn "
    "software programming with us step by step Make money from home by learning programming",
                      style: TextStyle(color:Colors.white,fontSize: 16),
                    ),


                  ],),
              ),
            ),


          ),

        ],

      )

    );
  }
}






