import 'package:flutter/material.dart';
import 'package:psylethia/components/widgets/app_bar/search_page.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color foregroundColor;
  final Color backgroundColor;

  const MyAppBar({
    super.key,
    this.foregroundColor = Colors.black,
    this.backgroundColor = const Color(0xFFA376A2),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      title: SizedBox(
        height: 40,
        child: TextField(
          readOnly: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SearchPage()),
            );
          },
          decoration: InputDecoration(
            hintText: 'Search Psylethia.com',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(Icons.search, color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
