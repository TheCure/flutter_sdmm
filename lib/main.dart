import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_flutter1/common/colors_util.dart';
import 'package:my_flutter1/common/sharedPreference_util.dart';
import 'package:my_flutter1/widgets/homepage/activity_home.dart';
import 'package:my_flutter1/widgets/homepage/activity_login.dart';
import 'package:my_flutter1/widgets/homepage/activity_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<ResultData> l;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    //初始化下拉刷新上拉加载默认样式
    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      // 设置EasyRefresh的默认样式
      EasyRefresh.defaultHeader = ClassicalHeader(
        refreshText: "下拉刷新",
        refreshReadyText: "释放刷新",
        refreshingText: '正在刷新....',
        refreshedText: "刷新完成",
        refreshFailedText: "刷新失败",
        noMoreText: "没有更多数据",
        textColor: Colors.black,
        bgColor: Colors.white,
        infoText: '更新于: %T',
      );
      EasyRefresh.defaultFooter = ClassicalFooter(
        loadText: "上拉加载更多",
        loadReadyText: "释放加载",
        loadingText: '正在加载....',
        loadedText: "加载完成",
        loadFailedText: "加载失败",
        noMoreText: "没有更多数据",
        textColor: Colors.black,
        bgColor: Colors.white,
        infoText: '更新于: %T',
      );
    });
    login();
    // SharedPreferencesUtils.isLogin().then((value) => {isLogin = value});
  }

/*
* 获取是否登录过
* */
  Future<void> login() async {
    await SharedPreferencesUtils.isLogin().then((value) => {isLogin = value});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: ColorUtil.main_color),
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_activity",
      routes: {
        "/": (context) => ActivityHome(),
        "splash_activity": (context) => Activity_Splash(isLogin: isLogin),
        "login_activity": (context) => ActivityLogin(),
      },
      localizationsDelegates: [
        // GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
    );
  }
}
