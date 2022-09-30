import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/controllers/controller_user_list.dart';
import 'package:lokman_to_do/widgets/widget_text.dart';

class ViewUserList extends StatelessWidget {
  final int? id;

  ViewUserList({Key? key, this.id}) : super(key: key);
  final c = Get.put(ControllerUserList());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Scaffold(
          appBar: AppBar(
            title: Text("Kullanıcılar"),
          ),
          body: body(),
        )));
  }

  Widget body() {
    return SingleChildScrollView(
      child: c.userList!.length == 0
          ? SizedBox(height: 400,child: Center(child: CupertinoActivityIndicator()))
          : ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 20.0),
              scrollDirection: Axis.vertical,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: c.userList!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            c.userList![index].avatar,
                          ),
                          radius: 32,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                TextBasic(
                                    text: c.userList![index].firstName!,
                                    fontSize: 14),
                                SizedBox(
                                  width: 4,
                                ),
                                TextBasic(
                                    text: c.userList![index].lastName!,
                                    fontSize: 14),
                              ],
                            ),
                            TextBasic(
                                text: c.userList![index].email!, fontSize: 14),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              }),
    );
  }
}
