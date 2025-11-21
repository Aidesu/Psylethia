import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.home_outlined, color: Colors.black),
            iconSize: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.person_3_outlined, color: Colors.black),
            iconSize: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
            iconSize: 35,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.black),
            iconSize: 35,
          ),
          label: '',
        ),
      ],
    );
  }
}
