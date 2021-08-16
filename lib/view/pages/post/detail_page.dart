import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'update_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);
  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "글 제목!!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Divider(),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.off(HomePage()); // 갱신하고 다시 못돌아감.
                  },
                  child: Text("삭제"),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.to(UpdatePage());
                  },
                  child: Text("수정"),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text("글 내용" * 500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}