import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lokman_to_do/shared/uicolor.dart';
import 'package:lokman_to_do/views/view_home.dart';
import 'package:lokman_to_do/views/view_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false,home:status == true ? const ViewHome() : ViewLogin()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lokman To Do',
      color: UIColor.lokmanColor,
      debugShowCheckedModeBanner: false,
      home: const ViewHome(),
    );
  }
}
