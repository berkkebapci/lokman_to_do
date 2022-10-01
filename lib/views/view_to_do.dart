// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/shared/uisize.dart';

class ViewToDo extends StatelessWidget {
  
  ViewToDo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Scaffold(
          appBar: AppBar(
            title: const Text("To Do"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: UIColor.lokmanColor,
          ),
          floatingActionButton: getFloatingActionButton(context),
          body: body(),
        )));
  }

  Widget body() {
    return SingleChildScrollView(child: getListView());
  }

  Widget getListView() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20 * UISize.autoSize),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 24 * UISize.autoSize,
              ),
              Container(
                  color: UIColor.white,
                  width: Get.width,
                  height: 80 * UISize.autoSize,
                  child: Column(
                    children: [
                      
                    ],
                  )),
            ],
          );
        });
  }

  Widget getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
      },
      backgroundColor: UIColor.lokmanColor,
      child: Icon(
        Icons.add,
      ),
    );
  }
}
