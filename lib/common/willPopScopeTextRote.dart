import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/widgets/homepage/activity_home.dart';

/*
*
*实体（虚拟）返回按钮点击两次回到桌面
* */
class WillPopScopeTextRote extends StatefulWidget {
  @override
  WillPopScopeTextRoteState createState() {
    return WillPopScopeTextRoteState();
  }
}

class WillPopScopeTextRoteState extends State<WillPopScopeTextRote> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          Scaffold.of(context)
              .showSnackBar(SnackBar(content: Text('再按一次 Back 按钮退出')));
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        Navigator.of(context).pop(true);
        return true;
      },
      child: ActivityHome(),
    );
  }
}
