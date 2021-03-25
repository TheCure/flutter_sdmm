import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/widgets/homepage/work_meeting_page.dart';

import 'house_keeper_page.dart';
import 'message_page.dart';
import 'my_info_page.dart';

class ActivityHome extends StatefulWidget {
  @override
  ActivityHomeState createState() {
    return ActivityHomeState();
  }

}

class ActivityHomeState extends State<ActivityHome> {
  List<Widget> _pageList;
  var _index = 0;

  @override
  void initState() {
    super.initState();
    _pageList = [
      MessagePage(),
      HouseKeeperPage(),
      WorkMeetingPage(),
      MyInfoPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _index,
          children: _pageList,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: ColorUtil.text_666666,
        type: BottomNavigationBarType.fixed,
        // 大于3个项，默认设置为BottomNavigationBarType.shifting,此处根据需求可更改
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_day), title: Text("AI神灯")),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text("会工作")),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("我的"))
        ],
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            this._index = index;
          });
        },
      ),
    );
  }
}
