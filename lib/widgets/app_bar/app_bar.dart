import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color foregroundColor;
  final Color backgroundColor;

  const MyAppBar({
    super.key,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.orangeAccent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Psylethia'),
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
