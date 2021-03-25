import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/constants.dart';
import 'package:my_flutter1/common/dioUtils.dart';
import 'package:my_flutter1/common/sharedPreference_util.dart';
import 'package:my_flutter1/common/toast_util.dart';
import 'package:my_flutter1/models/my_info_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyInfoPage extends StatefulWidget {
  @override
  MyInfoPageState createState() {
    return MyInfoPageState();
  }
}

class MyInfoPageState extends State<MyInfoPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  MyInfoBean infoBean;

  /*
* 网络请求
* */
  Future<void> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, dynamic> map = {
      "token": sp.getString("token"),
      "join_code": sp.getString("join_code"),
      "id": sp.getString("id"),
      "fram_id": sp.getString("fram_id"),
    };

    //开始请求
    var response = await DioHttpUtil().post(Constants.BRIEF, formData: map);
    if (response.statusCode == 200) {
      //请求体结果response，将数据转化为实体类
      var json = jsonDecode(response.data);
      infoBean = MyInfoBean.fromJson(json["data"]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // SharedPreferencesUtils.clearLoginInfo();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "imgs/mainbg.png",
            fit: BoxFit.fill,
            height: 264.0,
          ),
          Column(
            children: [
              _topInfo(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 15.0),
                height: 35.0,
                width: double.infinity,
                margin: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(18.5)),
                    color: ColorUtil.bag_f95e85),
                child: Text(
                  infoBean.post,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 11.5, left: 15.0, right: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                          shrinkWrap: true,
                          // 该属性将决定列表的长度是否仅包裹其内容的长度
                          physics: NeverScrollableScrollPhysics(),
                          //列表滚动至边缘后继续拖动的物理效果
                          itemBuilder: (context, index) {
                            return _item(index);
                          },
                          separatorBuilder: (context, index) =>
                              Divider(height: 0.5),
                          itemCount: listName.length))),
            ],
          )
        ],
      ),
    );
  }

  List<String> listName = ["邀请入驻", "门店推广二维码", "活动推广二维码", "意见反馈", "使用帮助", "设置"];
  List<IconData> listIcon = [
    Icons.icecream,
    Icons.keyboard,
    Icons.icecream,
    Icons.work,
    Icons.map,
    Icons.padding,
  ];
  var _color = [
    Colors.redAccent,
    Colors.green,
    Colors.blue,
    Colors.amberAccent,
    Colors.orangeAccent,
    Colors.lime
  ];

/*
*
* item列表
* */
  _item(int index) {
    return GestureDetector(
      child: Container(
        height: 48.5,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.0, right: 10.0),
              child: Icon(listIcon[index], color: _color[index]),
            ),
            Expanded(child: Text(listName[index])),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black12,
            ),
          ],
        ),
      ),
      onTap: () {
        if (index == 5) {
          Navigator.popAndPushNamed(context, "login_activity");
          SharedPreferencesUtils.clearLoginInfo();
        }
      },
    );
  }

/*
* 用户信息UI
* */
  _topInfo() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 59.0, left: 25.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(180.0),
            child: Image.network(
              infoBean.img,
              fit: BoxFit.fill,
              width: 59.0,
              height: 59.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 59.0, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                infoBean.name,
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding:
                        EdgeInsets.only(left: 6.0, right: 6.0, bottom: 0.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: Text(
                      "顾客保有${infoBean.user}人",
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 6.0, top: 10.0),
                    padding:
                        EdgeInsets.only(left: 6.0, right: 6.0, bottom: 0.5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        border: Border.all(color: Colors.white, width: 0.5)),
                    child: Text(
                      "工作${infoBean.work}年",
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
