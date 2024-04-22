import 'package:final_movie_app_20/core/componants/custom_button.dart';
import 'package:final_movie_app_20/core/componants/custom_text.dart';
import 'package:final_movie_app_20/core/models/sql_helper/save_movie_sql_helper.dart';
import 'package:final_movie_app_20/features/home/view/manager/saved_movie_provider.dart';
import 'package:final_movie_app_20/features/saved_movies/view/screens/saves_movies_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../../core/componants/custom_movie_card.dart';
import '../../../../core/models/movies_model.dart';

import '../../../movie_details/view/screens/movie_details_screen.dart';
import '../../../profile/view/manager/theme_const.dart';
import '../../../profile/view/manager/theme_mode_manager.dart';
import '../../../profile/view/screens/profile_screen.dart';
import '../../data/repo/home_repo.dart';
import '../widgets/custom_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();
  late  Future <List<MoviesModel>> movieResponse ;

  @override
  void initState() {

    Provider.of<SavedMovieProvider>(context,listen: false).fetchSavedMovies();
    super.initState();
    movieResponse = HomeRepo.getMovies();


  }
  Widget build(BuildContext context) {
    final currentMode = Provider.of<ThemeProvider>(context).themData;
    return
      Scaffold(
      appBar: AppBar(
        title: Text("Ur Movie",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:32),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,size: 35,))],
        backgroundColor:  Color(0xFF1F1F1F),
        leading: GestureDetector(
          onTap: (){
          },
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/2.jpg"),
          ),
        ),
      ),
    //  backgroundColor: Color(0xFF1F1F1F),

      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [
              FutureBuilder<List<MoviesModel>>(
                future: movieResponse ,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Text("${snapshot.error}");
                  }
                  if(snapshot.hasData){
                    print("----------${snapshot.data![5].id},${snapshot.data![5].description}");
                    return Expanded(
                      child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 6,
                                    color: Color(0xFFF48D15),

                                    ),
                                    CustomText( color:currentMode == darkTheme ? Colors.white : Colors.black, text: "Most popular",
                                      size:24,font_Weight: FontWeight.w500,)
                                  ],
                                ),
                                CustomSlider(),
                                SizedBox(  height: MediaQuery.of(context).size.height/140,),
                                Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 6,
                                      color: Color(0xFFF48D15),
                                    ),
                                    CustomText(
                                      color:currentMode == darkTheme ? Colors.white : Colors.black,
                                      text: "See All",
                                      size:24,
                                      font_Weight: FontWeight.w500,)
                                  ],
                                ),
                                GridView.builder(
                                  controller: scrollController,
                                  shrinkWrap: true,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16,
                                      childAspectRatio:(MediaQuery.of(context).size.width * 0.4) /200
                                  ),
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: (context, index) {
                                    return
                                      GestureDetector(
                                          child: CustomMovieCard(
                                            title: snapshot.data![index].title,
                                            image: snapshot.data![index].image,
                                            movie: snapshot.data![index],
                                             isSaved: Provider.of<SavedMovieProvider>(context).isSaved(snapshot.data![index]),

                                             save: (){
                                             if (
                                             Provider.of<SavedMovieProvider>(context,listen: false).isSaved(snapshot.data![index])){
                                               Provider.of<SavedMovieProvider>(context,listen: false).deleteSavedMovie(snapshot.data![index]);
                                             } else{
                                               Provider.of<SavedMovieProvider>(context,listen: false).addSavedMovie(snapshot.data![index]);
                                             }
                                             },
                                          ),
                                          onTap: (){

                                           // print("${snapshot.data![index].image}");

                                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(id: "${snapshot.data![index].id}")));

                                          });
                                  },),
                              ],
                            ),
                          )),
                    );
                  }

                  return Container(
                      child: Center(child: Image.asset("assets/Animation - 1713499251536.gif")));
                },),


            ],

          ),
        ),
      )


    );
  }
}
