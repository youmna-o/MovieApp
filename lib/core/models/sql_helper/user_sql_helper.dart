
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../user_model.dart';

final String tableUserData =  'userData';
final String columnEmail =      'email' ;
final String columnPasswrod =       'password'    ;


class UsersSQLHelper {
  Database ?db;
  UsersSQLHelper._internal();
  static final UsersSQLHelper instance = UsersSQLHelper._internal();
  factory UsersSQLHelper() {
    return instance;
  }

  Future open() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, "userData.db");
    db = await openDatabase(
        path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
create table $tableUserData ( 
  id integer primary key autoincrement, 
  $columnEmail text not null,
  $columnPasswrod text not null
  )
''');
        });
  }

  Future<UserModel> insert(UserModel userModel) async {
    await db?.insert(tableUserData,userModel.toJson());
    return userModel;
  }
  Future<List<UserModel>> getAllUsers() async {
    List<Map> maps = await db!.query(tableUserData);
    if (maps.length > 0) {
      return maps.map((e) => UserModel.fromJson(e as Map<String , dynamic>)).toList();
    }

    return [];
  }


  Future<UserModel?> getUser(String email) async {
    List<Map> maps = await db!.query(tableUserData,
        columns: [
          columnEmail,
          columnPasswrod
          ],
        where: '$columnEmail = ?',
        whereArgs: [email]);
    if (maps.length > 0) {
      return UserModel.fromJson(maps.first  as Map<String,dynamic>);
    }
    return null;
  }

  Future<int> delete(String email) async {
    return await db!.delete(tableUserData, where: '$columnEmail = ?', whereArgs: [email]);
  }


  Future<int> update(UserModel userModel) async {
    return await db!.update(tableUserData, userModel.toJson(),
        where: '$columnEmail = ?', whereArgs: [userModel]);
  }

  Future close() async => db!.close();
}