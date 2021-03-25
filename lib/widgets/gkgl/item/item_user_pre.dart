import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/constants.dart';
import 'package:my_flutter1/common/dioUtils.dart';
import 'package:my_flutter1/models/user_pre_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
* 顾客处方page
* */
class ItemUserPre extends StatefulWidget {
  int index;

  ItemUserPre({
    this.index,
  });

  @override
  ItemUserPreState createState() => ItemUserPreState();
}

class ItemUserPreState extends State<ItemUserPre>
    with AutomaticKeepAliveClientMixin {
  int _page = 1;
  List<ListBean> mList = [];
  EasyRefreshController _controller;

  /*
* 网络请求
* */
  Future<void> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map<String, dynamic> map = {
      "token": sp.getString("token"),
      "user_id": "22258",
      "join_code": sp.getString("join_code"),
      "page": "${_page}",
      "zt": "${widget.index + 1}",
    };
    //开始请求
    var response = await DioHttpUtil().post(Constants.USERPRES, formData: map);
    if (response.statusCode == 200) {
      //请求体结果response，将数据转化为实体类
      var json = jsonDecode(response.data);
      var list = json["data"]["list"] as List;
      var map = list.map((e) => ListBean.fromJson(e)).toList();
      // map.add(
      //     ListBean("ordernum", "name", 1, 2, "jis", "1", 1, 3, "1", "time"));
      if (_page == 1) {
        mList = [];
        mList.addAll(map);
      } else {
        mList.addAll(map);
      }

      if (mounted) {
        setState(() {});
      }
      _controller.finishLoad(noMore: map.length < 10);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    _controller = EasyRefreshController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return EasyRefresh(
    //   scrollController: _scrollController,
    //   footer: ClassicalFooter(),
    //   enableControlFinishLoad: true,
    //   // controller: _controller,
    //   child: SingleChildScrollView(
    //     child: MediaQuery.removePadding(
    //         context: context,
    //         removeTop: true,
    //         child: ListView.builder(
    //             shrinkWrap: true,
    //             physics: NeverScrollableScrollPhysics(),
    //             itemBuilder: (context, index) {
    //               return _list(index);
    //             },
    //             itemCount: mList.length)),
    //   ),
    //   onLoad: () {
    //     _page++;
    //     getData();
    //   },
    // );

    return EasyRefresh.custom(
      enableControlFinishLoad: true,
      enableControlFinishRefresh: true,
      controller: _controller,
      onLoad: () {
        _page++;
        getData();
      },
      onRefresh: () {
        _page == 1;
        getData();
        _controller.resetLoadState();
        // _controller.finishRefresh();
      },
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _listItem(index);
            },
            childCount: mList.length,
          ),
        )
      ],
    );
  }

  _listItem(int index) {
    String name = "";
    if (mList[index].isNew == 1) name = "新人定制";
    if (mList[index].isBai == 1) name = "百日打卡";

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0), color: Colors.white),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.0, right: 15.0),
                child: Text(
                  "${mList[index].name}",
                  style:
                      TextStyle(color: ColorUtil.text_333333, fontSize: 15.0),
                ),
              ),
              name != ""
                  ? Container(
                      height: 16.5,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0),
                          color: ColorUtil.bag_fff3f0),
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            color: ColorUtil.bag_ff9072, fontSize: 10.0),
                      ),
                    )
                  : Text("")
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              "预约技师：${mList[index].jisName}",
              style: TextStyle(color: ColorUtil.text_999999, fontSize: 11.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "剩余次数：",
                  style:
                      TextStyle(fontSize: 11.0, color: ColorUtil.text_999999),
                ),
                TextSpan(
                  text: "${mList[index].num1}",
                  style: TextStyle(fontSize: 11.0, color: ColorUtil.main_color),
                ),
                TextSpan(
                  text: "/${mList[index].num}",
                  style:
                      TextStyle(fontSize: 11.0, color: ColorUtil.text_999999),
                ),
              ]),
            ),
          ),
          Container(
            child: Text(
              "创建时间：${mList[index].time}",
              style: TextStyle(color: ColorUtil.text_999999, fontSize: 11.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
