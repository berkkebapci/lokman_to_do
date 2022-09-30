import 'package:flutter/material.dart';
import 'package:lokman_to_do/widgets/widget_text.dart';

class ViewToDo extends StatelessWidget {
  final int? id;

  const ViewToDo({Key? key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [TextBasic(text: "To Do")],
      ),
    );
  }
}
