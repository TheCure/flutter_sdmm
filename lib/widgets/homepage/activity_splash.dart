import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
* 启动页
* */
class Activity_Splash extends StatefulWidget {
  @override
  _Splash_State createState() {
    return _Splash_State();
  }

  final bool isLogin;

  Activity_Splash({
    this.isLogin,
  });
}

class _Splash_State extends State<Activity_Splash> {
  @override
  void initState() {
    super.initState();
    _startRecordTime();
  }

/*
* 倒计时
* */
  void _startRecordTime() {
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_content <= 1) {//跳转页面
          if (widget.isLogin) {
            Navigator.popAndPushNamed(context, "/");
          } else {
            Navigator.popAndPushNamed(context, "login_activity");
          }

          _countdownTimer.cancel();
          _countdownTimer = null;
        } else {
          _content -= 1;
        }
      });
    });
  }

  Timer _countdownTimer;
  int _content = 5;

  @override
  void dispose() {
    super.dispose();
    if (_countdownTimer != null && _countdownTimer.isActive) {
      _countdownTimer.cancel();
      _countdownTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Image.asset(
              "imgs/shanping.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              margin: EdgeInsets.only(top: 50.0, right: 20.0),
              child: GestureDetector(
                onTap: () {//跳转页面
                  if (widget.isLogin) {
                    Navigator.popAndPushNamed(context, "/");
                  } else {
                    Navigator.popAndPushNamed(context, "login_activity");
                  }
                },
                child: Text("跳过${_content}"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
