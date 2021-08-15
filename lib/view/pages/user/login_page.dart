import 'package:flutter/material.dart';
import 'package:flutter_blog/controller/user_controller.dart';
import 'package:flutter_blog/domain/user/user_repository.dart';
import 'package:flutter_blog/util/validator_util.dart';
import 'package:flutter_blog/view/components/custom_elevated_button.dart';
import 'package:flutter_blog/view/components/custom_text_form_field.dart';
import 'package:flutter_blog/view/pages/post/home_page.dart';
import 'package:get/get.dart';

import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  UserController u = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 200,
              alignment: Alignment.center,
              child: Text(
                "로그인 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            funValidator: validateUsername(),
            hint: "Username",
          ),
          CustomTextFormField(
            funValidator: validatePassword(),
            hint: "Password",
          ),
          CustomElevatedButton(
            text: "로그인",
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                // Get.to(HomePage());
                u.login("ssar", "1234");
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원이 아니신가요?"),
          )
        ],
      ),
    );
  }
}
