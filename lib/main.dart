import 'package:flutter/material.dart';

import 'package:flutter_blog/view/pages/user/login_page.dart';

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
      home: LoginPage(),
    );
  }
}
