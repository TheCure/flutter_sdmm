import 'dart:convert';

import 'package:event_bus/event_bus.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class Constants {
  //"http://wthrcdn.etouch.cn/weather_mini"
  // static const String BASE_URL = "https://cnodejs.org/api/v1/";
  static const String JISUJOKE = "user/alsotang";
  static const String BASE_URL =
      "http://pc.test.api.shendengzhineng.com/index.php/";
  static const String LOGIN = "v5.login/index";
  static const String GETNUM_MESSAGE = "v5.Messlist/getNum";
  static const String BRIEF = "v5.Bdframe/brief";//我的页面
  static const String USERPRES = "v5.user_new/user_pres";//处方

  static final EventBus eventBus = new EventBus();

  // md5 加密
  static String generate_MD5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }
}
