import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/constants.dart';
import 'package:my_flutter1/common/dioUtils.dart';
import 'package:my_flutter1/common/my_appbar.dart';
import 'package:my_flutter1/common/sharedPreference_util.dart';
import 'package:my_flutter1/common/toast_util.dart';
import 'package:my_flutter1/models/login_bean.dart';

import 'activity_home.dart';

/*
* 登录页面
* */
class ActivityLogin extends StatefulWidget {
  @override
  ActivityLoginState createState() {
    return ActivityLoginState();
  }
}

class ActivityLoginState extends State<ActivityLogin> {
  TextEditingController phoneController;
  TextEditingController passController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
    passController = TextEditingController();
    phoneController.text = "18600003333";
    passController.text = "888888";
  }

  /*
* 网络请求
* */
  Future<void> getData() async {
    Map<String, dynamic> map = {
      "account": phoneController.text.toString(),
      "password": Constants.generate_MD5(passController.text.toString()),
    };
    //开始请求
    var response = await DioHttpUtil().post(Constants.LOGIN, formData: map);
    if (response.statusCode == 200) {
      //请求体结果response，将数据转化为实体类
      var json = jsonDecode(response.data);

      var s = json["data"]["join_code"] as List;
      var mList = s.map((e) => Join_code.fromJson(e)).toList();

      await SharedPreferencesUtils.saveLoginInfo({
        "phone": phoneController.text.toString(),
        "password": passController.text.toString(),
        "token": json["data"]["token"],
        "account_id": json["data"]["account"],
        "id": "${json["data"]["id"]}",
        "fram_id": "${mList[0].framId}",
        "join_code": "${mList[0].code}"
      });
      ToastUtils.showToastCenter("登录成功");

      Navigator.pushAndRemoveUntil(
        context,
        new MaterialPageRoute(builder: (context) => ActivityHome()),
        (route) => route == null,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    passController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          backgroundColor: Colors.white,
          // backgroundColor: ColorUtil.main_color,
          rightTitleClick: () {
            // ToastUtils.showToast("未完善", gravity: ToastGravity.CENTER);
          },
          title: "登录",
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35.0, bottom: 20.0),
                alignment: Alignment.center,
                child: Image.asset(
                  "imgs/login_logo.png",
                  width: 50.0,
                  height: 65.0,
                ),
              ),
              _editStyle("请输入手机号", 1),
              _editStyle("请输入登录密码", 2),
              Container(
                height: 49.0,
                width: double.infinity,
                margin: EdgeInsets.only(top: 15.0),
                padding: EdgeInsets.only(left: 37.5, right: 37.5),
                child: GestureDetector(
                  onTap: () {
                    if (isLogin()) {
                      getData();
                    }
                  },
                  child: _loginButtonStyle(),
                ),
              ),
            ],
          ),
        ));
  }

/*
* 是否满足登录条件
* */
  bool isLogin() {
    if (phoneController.text.length != 11 || phoneController.text[0] != "1") {
      ToastUtils.showToastCenter("请检查手机号是否正确！");
      return false;
    } else if (passController.text.length < 6) {
      ToastUtils.showToastCenter("密码不能少于六位！");
      return false;
    }
    return true;
  }

/*
* 输入框样式
* */
  Widget _editStyle(String hintText, int type) {
    return Container(
      padding: EdgeInsets.only(left: 37.5, right: 37.5, bottom: 20.0),
      child: TextField(
        controller: type == 1 ? phoneController : passController,
        keyboardType: type == 1 ? TextInputType.phone : TextInputType.text,
        //用于设置该输入框默认的键盘输入类型
        obscureText: type == 2 ? true : false,
        //是否隐藏正在编辑的文本
        textInputAction: TextInputAction.next,
        style: TextStyle(color: ColorUtil.text_333333, fontSize: 18),
        strutStyle: StrutStyle(),
        autofocus: true,
        inputFormatters: [
          type == 1
              ? WhitelistingTextInputFormatter.digitsOnly //只允许输入数字
              : WhitelistingTextInputFormatter(RegExp("[a-zA-Z]|[0-9]")),
          //只允许输入字母和数字   汉字[\u4e00-\u9fa5]
          LengthLimitingTextInputFormatter(11),
        ],
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0.0),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtil.text_cccccc, width: 0.5),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorUtil.text_cccccc, width: 0.5),
            ),
            hintText: hintText,
            hintStyle: TextStyle(color: ColorUtil.text_cccccc, fontSize: 18)),
      ),
    );
  }

/*
* 登录按钮样式
* */
  _loginButtonStyle() {
    return DecoratedBox(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "登录",
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
      ),
      decoration: BoxDecoration(
        color: Color(0x99000000),
        gradient: LinearGradient(
            colors: [ColorUtil.main_color, ColorUtil.bag_f87342]),
        //背景渐变
        borderRadius: BorderRadius.circular(28.0), //28像素圆角
      ),
    );
  }
}
