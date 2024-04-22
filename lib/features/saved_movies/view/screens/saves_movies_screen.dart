import 'package:final_movie_app_20/core/componants/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../../../core/componants/custom_movie_card.dart';
import '../../../../core/models/movies_model.dart';
import '../../../home/view/manager/saved_movie_provider.dart';
import '../../../home/view/screens/home_screen.dart';
import '../../../movie_details/view/screens/movie_details_screen.dart';



class SavedMoviesScreen extends StatefulWidget {
  const SavedMoviesScreen({super.key});

  @override
  State<SavedMoviesScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SavedMoviesScreen> {
  final ScrollController scrollController = ScrollController();
  late  Future <List<MoviesModel>> movieResponse ;
  @override
  void initState() {
    super.initState();


  }
  Widget build(BuildContext context) {
    final savedMovies = Provider.of<SavedMovieProvider>(context).savedmovies;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ur Movie",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:32),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: Colors.white,size: 35,))],
        backgroundColor:  Color(0xFF1F1F1F),
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/2.jpg"),
        ),),
      //backgroundColor: Color(0xFF1F1F1F),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Column(
            children: [

               Expanded(
                      child: savedMovies?.isEmpty?? true ?
                          Container(child: CircularProgressIndicator(),) :
                          Container(
                          child: SingleChildScrollView(
                            child: GridView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 16,
                                  childAspectRatio:(MediaQuery.of(context).size.width * 0.4) /200
                              ),
                              itemCount: savedMovies?.length,
                              itemBuilder: (context, index) {
                                return
                                  GestureDetector(
                                      child: CustomMovieCard(
                                        title: savedMovies![index].title,
                                        image: savedMovies![index].image,
                                        movie: savedMovies![index],
                                        isSaved: Provider.of<SavedMovieProvider>(context).isSaved(savedMovies![index]),
                                        save: (){
                                          if(Provider.of<SavedMovieProvider>(context,listen: false).isSaved(savedMovies![index]))
                                          {
                                            Provider.of<SavedMovieProvider>(context,listen: false).deleteSavedMovie(savedMovies![index]);
                                          } else{
                                            Provider.of<SavedMovieProvider>(context,listen: false).addSavedMovie(savedMovies![index]);};
                                        },

                                      ),
                                      onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetailsScreen(id: "${savedMovies![index].id}")));

                                      });
                              },),
                          )),
                    )



            ],

          ),
        ),),


    );
  }
}
