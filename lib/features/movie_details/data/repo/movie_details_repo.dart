import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/models/movie_details_model.dart';

class MovieDetailsRepo{
  static Future<MovieDetailsModel> getMovieDetails(String id) async {
    try {
      final endpoint = "https://imdb-top-100-movies.p.rapidapi.com/$id";

      final Map<String, String> headers = {
        'X-RapidAPI-Key': 'f102622c6cmshcae58475e52ee53p1ce291jsn5c76465a7930',
        'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
      };

      final response = await http.get(Uri.parse(endpoint), headers: headers);

      final decodeResponse = jsonDecode(response.body);

      final Map<String , dynamic> json = jsonDecode(response.body);
      MovieDetailsModel movieDetailsModel = MovieDetailsModel.fromJson(json);
      return movieDetailsModel ;

    } catch (e){
      print('the error ' + e.toString());
      throw Exception(' Please try again.');

    }
  }
}
