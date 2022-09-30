import 'package:flutter/material.dart';

class ViewToDo extends StatelessWidget {
  final int? id;

  const ViewToDo({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: const [Text("ToDo")],
      ),
    );
  }
}
