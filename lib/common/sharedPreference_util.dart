import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

/*
* SharedPreferences保存数据工具类
* */
class SharedPreferencesUtils {
  static const String IS_LOGIN = "isLogin"; //是否登录
  static const String PASSWORD = "password"; //密码
  static const String PHONE = "phone"; //手机号
  static const String ACCOUNT_ID = "account_id"; //员工id
  static const String FRAM_ID = "fram_id"; //fram_id
  static const String TOKEN = "token";
  static const String USER_ID = "id";//用户id
  static const String JOIN_CODE = "join_code";//join_code

  // 保存用户登录信息，data中包含了账号密码等信息
  static saveLoginInfo(Map data) async {
    if (data != null) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString(PHONE, data['phone']);
      await sp.setString(PASSWORD, data['password']);
      await sp.setString(TOKEN, data['token']);
      await sp.setString(ACCOUNT_ID, data['account_id']);
      await sp.setString(USER_ID, data['id']);
      await sp.setString(FRAM_ID, data['fram_id']);
      await sp.setString(JOIN_CODE, data['join_code']);
      await sp.setBool(IS_LOGIN, true);
    }
  }

  // 清除登录信息
  static clearLoginInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString(PHONE, "");
    await sp.setString(PASSWORD, "");
    await sp.setBool(IS_LOGIN, false);
  }

  // 是否登录
  static Future<bool> isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool b = sp.getBool(IS_LOGIN);
    return b != null && b;
  }

  // 获取token
  static Future<String> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(TOKEN);
  }

  // 获取account_id
  static Future<String> getAccounId() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(ACCOUNT_ID);
  }
// 保存用户个人信息
// static Future<LoginBeanEntity> saveUserInfo(
//     List<LoginBeanEntity> data) async {
//   if (data != null) {
//     SharedPreferences sp = await SharedPreferences.getInstance();

//   String name = data['name'];
//   num id = data['id'];
//   String gender = data['gender'];
//   String location = data['location'];
//   String avatar = data['avatar'];
//   String email = data['email'];
//   String url = data['url'];
//   await sp.setString(SP_USER_NAME, name);
//   await sp.setInt(SP_USER_ID, id);
//   await sp.setString(SP_USER_GENDER, gender);
//   await sp.setString(SP_USER_AVATAR, avatar);
//   await sp.setString(SP_USER_LOC, location);
//   await sp.setString(SP_USER_EMAIL, email);
//   await sp.setString(SP_USER_URL, url);
//   UserInfo userInfo = UserInfo(
//       id: id,
//       name: name,
//       gender: gender,
//       avatar: avatar,
//       email: email,
//       location: location,
//       url: url);
//   return userInfo;
//   }
//   return null;
// }
//
//  // 获取用户信息
//  static Future<UserInfo> getUserInfo() async {
//    SharedPreferences sp = await SharedPreferences.getInstance();
//    bool isLogin = sp.getBool(SP_IS_LOGIN);
//    if (isLogin == null || !isLogin) {
//      return null;
//    }
//    UserInfo userInfo = UserInfo();
//    userInfo.id = sp.getInt(SP_USER_ID);
//    userInfo.name = sp.getString(SP_USER_NAME);
//    userInfo.avatar = sp.getString(SP_USER_AVATAR);
//    userInfo.email = sp.getString(SP_USER_EMAIL);
//    userInfo.location = sp.getString(SP_USER_LOC);
//    userInfo.gender = sp.getString(SP_USER_GENDER);
//    userInfo.url = sp.getString(SP_USER_URL);
//    return userInfo;
//  }

}
