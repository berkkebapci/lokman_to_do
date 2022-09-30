import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lokman_to_do/models/user_list.dart';

class ControllerUserList extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    await getUserList();
    update();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final RxList<dynamic> _userList = [].obs;
  List<dynamic>? get userList => _userList; 

  final Rx<ModelUserList> _modelUserList = ModelUserList().obs;
  ModelUserList get modelUserList => _modelUserList.value;

  Future<void> getUserList() async {
    var response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      _userList.value = json
        .decode(response.body)['data']
        .map((data) => Data.fromJson(data))
        .toList();
    } else {
      Get.snackbar("title", "");
    }
  }
}
