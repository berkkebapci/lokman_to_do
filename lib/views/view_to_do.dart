// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/controllers/controller_to_do.dart';
import 'package:lokman_to_do/models/storage_item.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/shared/uisize.dart';
import 'package:lokman_to_do/views/view_login.dart';
import 'package:lokman_to_do/widgets/widget_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewToDo extends StatelessWidget {
  ViewToDo({Key? key}) : super(key: key);
  final c = Get.put(ControllerToDo());

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            title: const Text("To Do"),
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: UIColor.lokmanColor,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8 * UISize.autoSize),
                child: InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.clear();
                      Get.offAll(ViewLogin());
                    },
                    child: const Icon(Icons.exit_to_app)),
              )
            ],
          ),
          floatingActionButton: getFloatingActionButton(context),
          body: body(),
        )));
  }

  Widget body() {
    return SingleChildScrollView(
        child: c.list!.isNotEmpty ? getListView() : getEmpty());
  }

  Widget getListView() {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 12 * UISize.autoSize),
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: c.list!.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 12 * UISize.autoSize,
              ),
              InkWell(
                onTap: (){
                  c.setCompleted(index);
                },
                child: Container(
                    width: Get.width,
                    height: 66 * UISize.autoSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: UIColor.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 12 * UISize.autoSize,
                            ),
                            c.list![index].status == 'Tamamlanmadı'
                                ? Icon(
                                    Icons.circle_outlined,
                                    color: UIColor.lokmanColor,
                                  )
                                : Icon(
                                    Icons.check_circle_rounded,
                                    color: UIColor.lokmanColor,
                                  ),
                            SizedBox(
                              width: 12 * UISize.autoSize,
                            ),
                            TextBasic(
                              text: c.list![index].name,
                              fontSize: 14 * UISize.autoSize,
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    c.deleteSecureData(c.list![index]);
                                    c.readAllSecureData();
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: UIColor.lokmanColor,
                                  ),
                                ),
                                SizedBox(height: 4 * UISize.autoSize,),
                                TextBasic(text: c.list![index].status)
                              ],
                            ),
                            SizedBox(
                              width: 12 * UISize.autoSize,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          );
        });
  }

  Widget getEmpty() {
    return Center(
        child: Column(
      children: [
        SizedBox(
          height: 40 * UISize.autoSize,
        ),
        TextBasic(
          text: "Yeni Bir Görev Eklemek İçin \nSağ Alttaki Butona Tıklayınız",
          textAlign: TextAlign.center,
          fontSize: 22 * UISize.autoSize,
        ),
      ],
    ));
  }

  Widget getFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Center(child: TextBasic(text: 'Yeni Görev Ekle', fontSize: 16,)),
              content: TextField(
                controller: c.controller,
                autofocus: true,
                cursorColor: UIColor.lokmanColor,
              ),
              actions: [
                InkWell(
                    onTap: () {
                      c.writeSecureData(
                          StorageItem(c.controller.text, 'Tamamlandı'));
                      c.controller.clear();
                      Get.back();
                    },
                    child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12 * UISize.autoSize, vertical: 8 * UISize.autoSize),
                        decoration: BoxDecoration(
                            color: UIColor.lokmanColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextBasic(
                          text: 'Ekle',
                          color: UIColor.white,
                        ))),
              ],
            );
          },
        );
      },
      backgroundColor: UIColor.lokmanColor,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
