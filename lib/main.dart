import 'package:EcoPost/frontend/around_me_page.dart';
import 'package:EcoPost/frontend/comments_page.dart';
import 'package:EcoPost/frontend/home_page.dart';
import 'package:EcoPost/frontend/leaderboard_page.dart';
import 'package:EcoPost/frontend/login_page.dart';
import 'package:EcoPost/frontend/point_redeem_page.dart';
import 'package:EcoPost/frontend/shop_page.dart';
import 'package:EcoPost/utilities/constants.dart';
import 'package:EcoPost/frontend/my_profile_page.dart';

import 'package:flutter/material.dart';

import 'frontend/profile_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the MapView Screen
//        '/ReportPage': (context) => ChangeNotifierProvider(
//            create: (context) => FormInfo(), child: ReportPage()),
        '/HomePage': (context) => new MyHome(),
//        '/AroundMeTab': (context) => new AroundMe(),
        '/ProfilePage': (context) => new MyProfilePage(),
        '/LeaderBoardPage': (context) => new LeaderboardPage(),
        '/PointsPage': (context) => new ShopPage(),
        '/CommentsPage': (context) => new CommentsPage(),



      },
      theme: ThemeData(
        primaryColor: Constants.themeGreen,
          ),
      // TODO: Add boolean using shared pref package to only show login once
      home: MyHome(),
    );
  }
}
