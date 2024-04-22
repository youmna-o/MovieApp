import 'package:flutter/cupertino.dart';

import '../../../../core/models/sql_helper/user_sql_helper.dart';
import '../../../../core/models/user_model.dart';

class UserDataProvider extends ChangeNotifier{
  List <UserModel>? _userdata ;

  List<UserModel>? get userdata => _userdata;

  set userdata(List<UserModel>? value) {
    _userdata = value;
    notifyListeners();
  }
  Future<void> fetchUsers() async {
    userdata = await UsersSQLHelper.instance.getAllUsers();
  }

  Future <void> addUser(UserModel user) async {
    await UsersSQLHelper.instance.insert(user);
    await fetchUsers();
  }
  Future <void> deleteUser(UserModel user) async {
    await UsersSQLHelper.instance.delete(user.email);
    await fetchUsers();
  }
  bool isExist(UserModel user){
    return userdata?.any((element) => element.email == user.email) ?? false ;

  }
}