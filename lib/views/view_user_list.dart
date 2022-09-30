// ignore_for_file: prefer_is_empty

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/controllers/controller_user_list.dart';
import 'package:lokman_to_do/shared/uisize.dart';
import 'package:lokman_to_do/widgets/widget_text.dart';

class ViewUserList extends StatelessWidget {
  final int? id;

  ViewUserList({Key? key, this.id}) : super(key: key);
  final c = Get.put(ControllerUserList());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Scaffold(
          appBar: AppBar(
            title: const Text("Kullanıcılar"),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: body(),
        )));
  }

  Widget body() {
    return SingleChildScrollView(
        child: c.userList!.length == 0
            ? SizedBox(
                height: 400 * UISize.autoSize,
                child: const Center(child: CupertinoActivityIndicator()))
            : getListView());
  }

  Widget getListView() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 20 * UISize.autoSize),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: c.userList!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 12 * UISize.autoSize,
              ),
              Row(
                children: [
                  getUserImage(index),
                  SizedBox(
                    width: 12 * UISize.autoSize,
                  ),
                  getUserInfo(index),
                ],
              ),
            ],
          );
        });
  }

  Widget getUserImage(int index) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        c.userList![index].avatar,
      ),
      radius: 32 * UISize.autoSize,
    );
  }

  Widget getUserInfo(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextBasic(
              text: c.userList![index].firstName!,
              fontSize: 14 * UISize.autoSize,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              width: 4,
            ),
            TextBasic(
              text: c.userList![index].lastName!,
              fontSize: 14 * UISize.autoSize,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
        TextBasic(
            text: c.userList![index].email!, fontSize: 14 * UISize.autoSize),
      ],
    );
  }
}
