import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:divya_shravya/Profile/model/user.dart';


class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';
  static const myUser = User(
    imagePath:
        'https://source.unsplash.com/user/c_v_r/1900x800',
    name: 'Aresrana',
    email: 'ares@gmail.com',
    about:
    'Certified Personal Trainer and Nutritionist',

    isDarkMode: false,
  );

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();


  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser()  {

    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
    //final json = _preferences.getString(_keyUser);

   // return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
