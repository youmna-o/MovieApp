class MovieDetailsModel{

  final int    rank;
  final String title;
  final String description;
  final String image;
  final int   year;
  final String trailer;
  final String  id ;
  final String trailer_youtube_id;
  final String  rating ;
  final List <dynamic>director ;
  final List <dynamic> genre;

  MovieDetailsModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.year ,
    required this.trailer,
    required this.id ,
    required this.trailer_youtube_id ,
    required this.rating ,
    required this.director,
    required this.genre,
    });
  factory MovieDetailsModel.fromJson(Map <String , dynamic> json ){
    return MovieDetailsModel(
      rank:        json['rank'],
      title:       json['title']   ,
      description: json['description'] ,
      image:       json['image'],
      year:       json['year'],
      trailer:     json['trailer'],
      id : json['id'],
      trailer_youtube_id : json['trailer_youtube_id'],
      rating : json['rating'],
      director :json['director'],
        genre :json['genre'],

    );
  }
  Map <String , dynamic> toJson(){
    return {
      'rank':rank,
      'title' :title,
      'description':description,
      'image':image,
      'year':year,
      'trailer':trailer,
      'id':id,
      'trailer_youtube_id' :trailer_youtube_id,
      'rating':rating,
      'director':rating,
      'genre': genre,
      'director':director,

    };
  }
}
