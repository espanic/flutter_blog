import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/post_controller.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:get/get.dart';

import 'home_page.dart';
import 'update_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);
  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;
    UserController u = Get.find();
    PostController p = Get.find();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${p.post.value.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Divider(),
              u.principal.value.id == p.post.value.user!.id
                  ? Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await p.deleteById(p.post.value.id!);
                            Get.off(() => HomePage()); // 갱신하고 다시 못돌아감.
                          },
                          child: Text("삭제"),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage());
                          },
                          child: Text("수정"),
                        )
                      ],
                    )
                  : SizedBox(),
              Expanded(
                child: SingleChildScrollView(
                  child: Text("${p.post.value.content}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
