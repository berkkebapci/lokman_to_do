// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/controllers/controller_login.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/shared/uisize.dart';
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
      home: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: TextBasic(
              text: "Giriş Yap",
              color: UIColor.lokmanColor,
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: UIColor.white,
            centerTitle: true,
            elevation: 0,
          ),
          body: body(),
        ),
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
        c.isOnline == true ?
        Image.network(
            "https://eticaret.lokmanecza.com/Content/img/logo-loading.png",
            height: 60 * UISize.autoSize):Container(),
        SizedBox(
          height: 20 * UISize.autoSize,
        ),
        getTextField(
            "Mail Adresiniz".obs,
            Icon(
              Icons.abc,
              color: UIColor.transparent,
            ),
            c.usernameController,
            false),
        getTextField(
            "Şifreniz".obs,
            GestureDetector(
              onTap: () {
                c.setObscureText(!c.obscureText);
              },
              child: Icon(
                Icons.remove_red_eye,
                color: UIColor.lokmanColor,
              ),
            ),
            c.passwordController,
            c.obscureText),
        getButton()
      ],
    ));
  }

  Widget getTextField(RxString hintText, Widget icon,
      TextEditingController controller, bool obscureText) {
    return LoginTextField(
      obscureText: obscureText,
      suffixIcon: icon,
      hint: hintText.value,
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
        c.login();
      },
    );
  }
}
