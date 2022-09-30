import 'package:flutter/material.dart';
import 'package:lokman_to_do/views/view_to_do.dart';
import 'package:lokman_to_do/views/view_user_list.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);


  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _children = [ViewUserList(), const ViewToDo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Kullanıcılar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_increase),
            label: "To Do",
          ),
        ],
      ),
    );
  }
}
