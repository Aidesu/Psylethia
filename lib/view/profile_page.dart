import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Psylethia'),
        backgroundColor: Color(0xFFA376A2),
      ),
      body: Center(child: Container(child: Text('Profile Page'))),
    );
  }
}
