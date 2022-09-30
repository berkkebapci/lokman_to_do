import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
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

  final focusUsername = FocusNode();
  final focusPassword = FocusNode();

}
 