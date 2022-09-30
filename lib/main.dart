import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/views/view_home.dart';
import 'package:lokman_to_do/views/view_login.dart';

void main() {
  runApp(ViewLogin());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lokman To Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const ViewHome(),
    );
  }
}
