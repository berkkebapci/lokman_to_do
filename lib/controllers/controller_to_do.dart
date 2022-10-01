import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/models/storage_item.dart';
import 'package:lokman_to_do/services/storage_service.dart';

class ControllerToDo extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    init();
  }

  Future<void> init() async {
    readAllSecureData();
    update();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  final RxList<StorageItem> _list = <StorageItem>[].obs;
  List<StorageItem>? get list => _list;

  final TextEditingController _controller = TextEditingController();
  TextEditingController get controller => _controller;

  final RxBool _completed = true.obs;
  bool get completed => _completed.value;

  void setCompleted(int index) {
    list![index].status == "Tamamlanmadı" ? list![index].status = "Tamamlandı" : "Tamamlanmadı";
    readAllSecureData();
  }

  Future<void> writeSecureData(StorageItem newItem) async {
    await StorageService.secureStorage
        .write(key: newItem.name, value: newItem.status)
        .then((value) => readAllSecureData());
  }

  Future<List<StorageItem>> readAllSecureData() async {
    var allData = await StorageService.secureStorage.readAll();
    _list.value =
        allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return _list;
  }

  Future<void> deleteSecureData(StorageItem item) async {
    await StorageService.secureStorage.delete(key: item.name);
  }

}
