import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter1/widgets/gkgl/activity_user_pre.dart';

class WorkMeetingPage extends StatefulWidget {
  @override
  WorkMeetingState createState() {
    return WorkMeetingState();
  }
}

class WorkMeetingState extends State<WorkMeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, //状态栏文字颜色 黑或者白
        elevation: 0,
        centerTitle: true,
        title: Text(
          "会工作",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Activity_UserPre();
            }));
          },
          child: Text("跳转处方页面"),
        ),
      ),
    );
  }
}
