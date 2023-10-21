import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/user.dart';

class Services {
  static final Services _instance = Services._();
  factory Services() => _instance;
  static User? user;
  Services._() {
    _initService();
  }
  _initService() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var res = prefs.getString("user");
    print("USER_ID::$res");
    if (res != null) {
      user = User.fromJson(jsonDecode(res));
    }
  }
}
