import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color foregroundColor;
  final Color backgroundColor;
  final Function(String) onSearch;

  const MyAppBar({
    super.key,
    required this.onSearch,
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
          onChanged: onSearch,
          decoration: InputDecoration(
            hintText: 'Search Psylethia.com',
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            filled:
                true, // rend blanc l'input de recherche, sinon rend comme la couleur du fond
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
