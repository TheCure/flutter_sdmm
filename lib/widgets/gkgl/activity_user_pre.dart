import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/constants.dart';
import 'package:my_flutter1/common/dioUtils.dart';
import 'package:my_flutter1/common/my_tabbar.dart';
import 'package:my_flutter1/models/user_pre_bean.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'item/item_user_pre.dart';

class Activity_UserPre extends StatefulWidget {
  @override
  UserPreState createState() {
    return UserPreState();
  }
}

class UserPreState extends State<Activity_UserPre>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    //tabBar和tabBarView的滑动监听，滑动获取当前下标
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController = null;
  }

  List<String> _tabText = ["未完成", "已完成"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyTabBar(
              tabController: _tabController,
              tabText: _tabText,
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: _tabText
                  .asMap()
                  .keys
                  .map((e) => ItemUserPre(
                        index: e,
                      ))
                  .toList(),
            )),
          ],
        ),
      ),
    );
  }
}
