import 'package:flutter/cupertino.dart';
import '../../../../core/models/movies_model.dart';
import '../../../../core/models/sql_helper/save_movie_sql_helper.dart';

class SavedMovieProvider extends ChangeNotifier{
   List<MoviesModel>? _savedmovies ;

  List<MoviesModel>? get savedmovies => _savedmovies;

  set savedmovies(List<MoviesModel>? value) {
    _savedmovies = value;
    notifyListeners();
  }
   Future<void> fetchSavedMovies() async {
     savedmovies = await SaveMovieSqlHelper.instance.getSavedMovies();
   }
   Future<void> addSavedMovie (MoviesModel movie) async {
     await SaveMovieSqlHelper.instance.insert(movie);
     await fetchSavedMovies();
   }

   Future<void> deleteSavedMovie (MoviesModel movie) async {
     await SaveMovieSqlHelper.instance.delete(movie.title);
     await fetchSavedMovies();
   }
   bool isSaved(MoviesModel movie){
     return savedmovies?.any((element) => element.title == movie.title)?? false ;

   }

}