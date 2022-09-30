import 'package:flutter/material.dart';

class ViewUserList extends StatelessWidget {
  final int? id;

  const ViewUserList({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }


  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: const [Text("Kullanıcılar")],
      ),
    );
  }
}
