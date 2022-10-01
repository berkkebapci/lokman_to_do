// ignore_for_file: avoid_print, unrelated_type_equality_checks, unused_local_variable

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/models/login_model_post.dart';
import 'package:lokman_to_do/services/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:lokman_to_do/views/view_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerLogin extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    checkInternetConnection();
  }

  final RxBool _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  void setObscureText(bool status) {
    _obscureText.value = status;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  final GlobalKey<FormState> _keyFormLogin = GlobalKey<FormState>();
  GlobalKey<FormState> get keyFormLogin => _keyFormLogin;

  final TextEditingController _usernameController = TextEditingController();
  TextEditingController get usernameController => _usernameController;

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  final RxBool _online = false.obs;
  bool get isOnline => _online.value;

  final focusUsername = FocusNode();
  final focusPassword = FocusNode();

  void checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _online.value = true;
        print('connected');
      }
    } on SocketException catch (_) {
      print('not connected');
      _online.value = false;
    }
  }

  void login() async {
    if (_online == true) {
      LoginModelPost postitem = LoginModelPost(
        email: _usernameController.text,
        password: _passwordController.text,
      );

      var response =
          await http.post(Uri.parse(Endpoint.login), body: postitem.toJson());
      if (response.statusCode == 200) {
        String token = response.body;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("isLoggedIn", true);

        Get.offAll(() => const ViewHome());
      } else {
        Get.snackbar(
            "Giriş Yapılamadı", "Mail Adresinizi ve Şifrenizi Kontrol Ediniz");
      }
    } else {
      Get.snackbar("İnternet Bağlantınızı Kontrol Ediniz",
          "Uygulamayı Kullanabilmek İçin İnternete İhtiyaç Vardır");
    }
  }
}
