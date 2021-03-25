import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/constants.dart';
import 'package:my_flutter1/common/dioUtils.dart';
import 'package:my_flutter1/common/sharedPreference_util.dart';
import 'package:my_flutter1/models/message_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<ListBean> mList = [];

  /*
* 网络请求
* */
  Future<void> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, dynamic> map = {
      "token": sp.getString("token"),
      "account_id": sp.getString("account_id"),
      "join_code": sp.getString("join_code"),
    };
    //开始请求
    var response =
        await DioHttpUtil().post(Constants.GETNUM_MESSAGE, formData: map);
    if (response.statusCode == 200) {
      //请求体结果response，将数据转化为实体类
      var json = jsonDecode(response.data);
      var list = json["data"]["list"] as List;
      mList = list.map((e) => ListBean.fromJson(e)).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, //状态栏文字颜色 黑或者白
        elevation: 0,
        centerTitle: true,
        title: Text(
          "消息",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        itemCount: mList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
        separatorBuilder: (context, index) => Divider(height: 1.0),
      ),
    );
  }

/*
* item样式
* */
  _item(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        height: 70.0,
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.0, right: 10.0),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.network(
                      mList[index].img,
                      width: 40.0,
                      height: 40.0,
                    ),
                    mList[index].num != 0
                        ? Container(
                            height: 15.0,
                            padding: EdgeInsets.only(left: 3.0, right: 3.0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: ColorUtil.main_color),
                            child: Text(
                              "${mList[index].num}",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          )
                        : Text("")
                  ],
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mList[index].title,
                  style:
                      TextStyle(color: ColorUtil.text_333333, fontSize: 15.0),
                ),
                Text(
                  mList[index].depict,
                  style:
                      TextStyle(color: ColorUtil.text_999999, fontSize: 13.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
