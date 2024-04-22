import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../movies_model.dart';

final String tablemovies =  'movies';
final String columnId =       'id'  ;
final String columnRank =      'rank' ;
final String columnTitle =      'title' ;
final String columnDescription =    'description';
final String columnImage =       'image'  ;
final String columnYear =       'year'    ;
final String columnRating =      'rating'  ;




class SaveMovieSqlHelper {
  Database? db;
  SaveMovieSqlHelper._internal();
  static final SaveMovieSqlHelper instance = SaveMovieSqlHelper._internal();
  factory SaveMovieSqlHelper() {
    return instance;
  }

  Future open() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "savemovies.db");
    db = await openDatabase(
        path , version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tablemovies ( 
  movieId  integer primary key autoincrement, 
  $columnId        text not null,
  $columnRank    integer not null,
  $columnTitle      text not null,
  $columnDescription text not null,
  $columnImage    text not null,
  $columnYear      integer not null,
  $columnRating     text not null) 
''');
        });
  }

  Future<MoviesModel> insert(MoviesModel movieModel) async {
    await db!.insert(tablemovies, movieModel.toJson());
    return movieModel;
  }


  Future<List<MoviesModel>> getSavedMovies() async {
    List<Map> maps = await db!.query(tablemovies);
    if (maps.length > 0) {
      return maps.map((e) => MoviesModel.fromSQLiteMap(e as Map<String , dynamic>)).toList();
    }
    return [];
  }


  Future<MoviesModel?> getSavedMovie(String title) async {
    List<Map> maps = await db!.query(tablemovies,
        columns: [
          columnId         ,
          columnRank       ,
          columnTitle       ,
          columnDescription  ,
          columnImage      ,
          columnYear       ,
          columnRating    ,  ],
        where: '$columnTitle  = ?',
        whereArgs: [title]);
    if (maps.length > 0) {
      return MoviesModel.fromSQLiteMap(maps.first as Map<String,dynamic>);
    }
    return null;
  }


  Future<int> delete(String title) async {
    return await db!.delete(tablemovies, where: '$columnTitle  = ?', whereArgs: [title]);
  }

  Future<int> update(MoviesModel movieModel) async {
    return await db!.update(tablemovies, movieModel.toJson(),
        where: '$columnTitle  = ?', whereArgs: [movieModel.title]);
  }

  Future close() async => db!.close();
}