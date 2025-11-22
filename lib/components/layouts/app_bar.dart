import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Psylethia'),
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      backgroundColor: Color(0xFFA376A2),
    );
  }
}
