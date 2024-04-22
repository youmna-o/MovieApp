class MoviesModel{

  final int    rank;
  final String title;
  final String description;
  final String image;
  final int     year;
  final String  rating ;
  final String  id ;

  MoviesModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.year ,
    required this.rating ,
    required this.id ,
  });
  factory MoviesModel.fromJson(Map <String , dynamic> json ){
    return MoviesModel(
      rank:        json['rank'],
      title:       json['title']   ,
      description: json['description'] ,
      image:       json['image'],
      year:       json['year'],
      rating : json['rating'],
      id : json['id'],
    );
  }

  factory MoviesModel.fromSQLiteMap( Map <String,dynamic> json){
    return MoviesModel(
      rank:        json['rank'],
      title:       json['title']   ,
      description: json['description'] ,
      image:       json['image'],
      year:       json['year'],
      rating : json['rating'],
      id : json['id'],
    );
  }

  Map <String , dynamic> toJson(){
    return {
      'rank':rank,
      'title' :title,
      'description':description,
      'image':image,
      'year':year,
      'rating':rating,
      'id':id,
    };
  }
}

