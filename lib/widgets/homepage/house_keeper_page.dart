import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HouseKeeperPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark, //状态栏文字颜色 黑或者白
        elevation: 0,
        centerTitle: true,
        title: Text(
          "AI神灯",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text("AI神灯"),
      ),
    );
  }
}
