import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors_util.dart';
import 'my_underline_tabIndicator.dart';

/*
* TabBar
* */
class MyTabBar extends StatelessWidget {
  MyTabBar({
    this.tabController,
    this.tabText,
  });

  TabController tabController;

  List<String> tabText;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorUtil.text_333333,
              size: 20.0,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 30.0),
          height: 56.0,
          alignment: Alignment.bottomCenter,
          child: TabBar(
            indicatorWeight: 0.0,
            labelColor: ColorUtil.text_333333,
            //选中文字颜色
            unselectedLabelColor: ColorUtil.text_666666,
            //未选中文字颜色
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.normal, fontSize: 14.0),
            indicator: MyUnderlineTabIndicator(
                //选择条的样式
                borderSide: BorderSide(color: Colors.black, width: 2.0)),
            indicatorColor: Colors.black,
            //选择条颜色
            tabs: tabText.map((e) {
              return Tab(
                child: Text(e),
              );
            }).toList(),
            controller: tabController,
          ),
        ),
      ],
    );
  }
}
