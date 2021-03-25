import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* 标题栏
* */
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({
    Key key,
    this.backgroundColor = Colors.white,
    this.title,
    this.rightTitle = "",
    this.isActions = false,
    this.rightTitleClick,
  }) : super(key: key);
  final Function rightTitleClick; // 点击右侧按钮时的回调
  final Color backgroundColor;
  final String title;
  final String rightTitle; //右侧文字
  final bool isActions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0.0,
      actions: [actions()],
      // automaticallyImplyLeading: false,//是否显示返回按钮
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20.0,
          color: backgroundColor == Colors.white ? Colors.black : Colors.white,
        ),
      ),
      brightness:
          backgroundColor == Colors.white ? Brightness.light : Brightness.dark,
      title: Text(
        title,
        style: TextStyle(
            color:
                backgroundColor == Colors.white ? Colors.black : Colors.white),
      ),
    );
  }

/*
*右侧按钮
* */
  Widget actions() {
    return GestureDetector(
      onTap: rightTitleClick,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Text(rightTitle,
            style: TextStyle(
                color: backgroundColor == Colors.white
                    ? Colors.black
                    : Colors.white)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
