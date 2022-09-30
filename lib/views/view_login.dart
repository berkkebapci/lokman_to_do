// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/controllers/controller_login.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/shared/uisize.dart';
import 'package:lokman_to_do/views/view_home.dart';
import 'package:lokman_to_do/widgets/widget_button.dart';
import 'package:lokman_to_do/widgets/widget_text.dart';
import 'package:lokman_to_do/widgets/widget_textfield.dart';

class ViewLogin extends StatelessWidget {
  final int? id;

  ViewLogin({Key? key, this.id}) : super(key: key);
  final c = Get.put(ControllerLogin());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: TextBasic(text: "Giriş Yap", color: UIColor.osloGray),
          backgroundColor: UIColor.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: body(),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: 32 * UISize.autoSize,
        ),
        Image.network(
            "https://eticaret.lokmanecza.com/Content/img/logo-loading.png",
            height: 60 * UISize.autoSize),
        SizedBox(
          height: 20 * UISize.autoSize,
        ),
        getTextField(
            "Kullanıcı Adı",
            Icon(
              Icons.abc,
              color: UIColor.transparent,
            ),
            c.usernameController),
        getTextField("Şifre", Icon(Icons.remove_red_eye, color: UIColor.lokmanColor,), c.passwordController),
        getButton()
      ],
    ));
  }

  Widget getTextField(
      String hintText, Icon icon, TextEditingController controller) {
    return LoginTextField(
      obscureText: false,
      suffixIcon: icon,
      hint: hintText,
      controller: controller,
    );
  }

  Widget getButton() {
    return ButtonBasic(
      buttonText: "Giriş Yap",
      textColor: UIColor.white,
      bgColor: UIColor.lokmanColor,
      padding: 8 * UISize.autoSize,
      onTap: () {
        Get.to(() => const ViewHome());
      },
    );
  }
}
