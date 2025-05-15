import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_management/data/models/user_model.dart';

class AuthController {
  static String? token;
  static UserModel? userModel;

  static final String _tokenKey = 'token';
  static final String _userDataKey = 'user-data';

  //=======================Save User info============================
  static Future<void> saveUserInformation(
      String accessToken, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_tokenKey, accessToken);
    sharedPreferences.setString(_userDataKey, jsonEncode(userModel.toJson()));

    token = accessToken;
    userModel = userModel;
  }

//=======================Get User info============================
  static Future<void> getUserInformation() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(_tokenKey);
    String? savedUserModelString = sharedPreferences.getString(_userDataKey);
    if (savedUserModelString != null) {
      UserModel savedUserModel =
          UserModel.fromJson(jsonDecode(savedUserModelString));
      userModel = savedUserModel;
    }
    token = accessToken;
  }




}
