import 'package:flutter/material.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_area.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                value: "제목 * 2",
                hint: "Title",
                funValidator: validateTitle(),
              ),
              CustomTextArea(
                value: "글 내용" * 20,
                hint: "Content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: "글 수정하기",
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back(); // GetX 라이브러리 - Obs
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
