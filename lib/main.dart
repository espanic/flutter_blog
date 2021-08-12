import 'package:flutter/material.dart';
import 'package:flutter_blog/pages/post/update_page.dart';
import 'package:flutter_blog/pages/post/write_page.dart';
import 'package:flutter_blog/pages/user/join_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // route설계 필요 없음.
      home: JoinPage(),
    );
  }
}
