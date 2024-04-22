import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/models/movies_model.dart';
class HomeRepo{
  static Future<List<MoviesModel>> getMovies() async {
    try {
      final endpoint = "https://imdb-top-100-movies.p.rapidapi.com/";

      final Map<String, String> headers = {
        'X-RapidAPI-Key': 'f102622c6cmshcae58475e52ee53p1ce291jsn5c76465a7930',
        'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
      };

      final response = await http.get(Uri.parse(endpoint), headers: headers);

      final decodeResponse = jsonDecode(response.body);

      final List<MoviesModel> moviesList = <MoviesModel>[];
      for (var element in (decodeResponse as List )) {
        moviesList.add(MoviesModel.fromJson(element));
      }
      return moviesList;
    } catch (e){
      print('the error ' + e.toString());
      throw Exception(' Please try again.');

    }
  }
}
