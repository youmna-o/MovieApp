import 'package:final_movie_app_20/core/models/movie_details_model.dart';
import 'package:final_movie_app_20/features/movie_details/data/repo/movie_details_repo.dart';
import 'package:flutter/material.dart';
import 'package:rate/rate.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../core/componants/custom_button.dart';
import '../../../../core/componants/custom_contaoiner.dart';
import '../../../../core/componants/custom_text.dart';
import '../widgets/custom_genre_container.dart';
import '../widgets/trailer_player.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key,required this.id});
  final String id ;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
MovieDetailsRepo movieDetailsRepo = MovieDetailsRepo();
late YoutubePlayerController _controller ;

void initState(){
  super.initState();
}
  @override

  Widget build(BuildContext context) {
          return Scaffold(
           // backgroundColor: Color(0xFF1F1F1F),

            body: FutureBuilder<MovieDetailsModel?>(
           future: MovieDetailsRepo.getMovieDetails(widget.id),
            builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){

            _controller = YoutubePlayerController(
                initialVideoId: "${snapshot.data.trailer_youtube_id}");
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: MediaQuery.of(context).size.height*0.7,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(snapshot.data.image,
                      width: double.infinity,
                      fit: BoxFit.cover,),
                  ),
                  toolbarHeight: MediaQuery.of(context).size.height*0.1,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  ),
                  bottom: PreferredSize(
                    preferredSize:Size.fromHeight(MediaQuery.of(context).size.height*0.01),
                    child: Container(
                        decoration: BoxDecoration(
                            color:  Color(0xFF1F1F1F).withOpacity(0.8),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40)) ),
                        width: double.maxFinite,
                        padding: EdgeInsets.only(top: 4,bottom: 8,left: 16),

                        child: Row(
                          children: [
                            Container(
                                width:  MediaQuery.of(context).size.width*0.9,
                              child: CustomText(
                                text: "${snapshot.data.title}",
                                color: Colors.white,
                                font_Weight: FontWeight.w400,
                                size: 28,),
                            ),

                          ],

                        )),
                  ),

                ),
                SliverToBoxAdapter(
                  child: Container(
                     decoration: BoxDecoration(
                         color: Color(0xFF1F1F1F).withOpacity(0.8)
                         ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,color:Color(0xFFFAE315),size: 22,),
                              CustomText(
                                text: "${snapshot.data.rating}",
                                color:Color(0xFFFAE315),
                                size: 18,
                                font_Weight: FontWeight.bold,
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.47,),
                              CustomContainer(
                                height: MediaQuery.of(context).size.height/20,
                                width:  MediaQuery.of(context).size.width/3,
                                child:Center(child: Text(
                                  "Year : (${snapshot.data.year})",style: TextStyle(color:Colors.white,fontSize: 16,),)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              if (snapshot.data.genre.length >= 1)
                                CustomGenreContainer(
                                  text: "${snapshot.data.genre[0] ?? ''}",
                                ),
                              SizedBox(width: 8,),
                              if (snapshot.data.genre.length >= 2)
                                Row(
                                  children: [
                                    CustomGenreContainer(
                                      text: "${snapshot.data.genre[1] ?? ''}",
                                    ),
                                    SizedBox(width: 8,),
                                  ],
                                ),
                              if (snapshot.data.genre.length >= 3)
                                Row(
                                  children: [
                                    CustomGenreContainer(
                                      text: "${snapshot.data.genre[2] ?? ''}",
                                    ),
                                  ],
                                ),
                            ],
                          ),

                               SizedBox(height: 10,),

                         Row(
                           children: [
                             Container(
                               height: 25,
                               width: 6,
                               color: Color(0xFFF48D15),
                             ),
                             CustomText(text: "Discrebtion", size:30,font_Weight: FontWeight.w500,)
                           ],
                         ),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Text("${snapshot.data.description}",style: TextStyle(fontSize: 20,color: Colors.white),),
                         ),
                          SizedBox(height:  MediaQuery.of(context).size.height/26,),


                          CustomButton(
                            hight: MediaQuery.of(context).size.height/18,
                            child: Text("Show the movie trailer",style: TextStyle(color: Colors.white,fontSize: 22),),
                            width: MediaQuery.of(context).size.width*0.8,
                            onPressed:(){
                              showDialog(
                                  context: context,
                                  builder: (context){
                                    return TrailerPlayer(controller: _controller);
                              });
                            } ,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height/28,),
                          CustomText(text:
                          "Directed By : "
                            , size:30,font_Weight: FontWeight.w500,
                          color:  Color(0xFFF48D15),),

                          CustomText(text:
                          "${snapshot.data.director[0]}"
                            , size:30,font_Weight: FontWeight.w500,
                            ),
                  ]),
                ),),)

                ],

            );

                }
                else if(snapshot.hasError){
                return Center(child: Text("${snapshot.error}"));
                }
            return Container(
                child: Center(child: Image.asset("assets/Animation - 1713499251536.gif")));
                }
          ,)
          ,

          );
  }
}




