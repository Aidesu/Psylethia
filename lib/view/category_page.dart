import 'package:flutter/material.dart';
import 'package:psylethia/components/layouts/bottom_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psylethia'),
        backgroundColor: Color(0xFFA376A2),
      ),
      bottomNavigationBar: BottomBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Shop by category',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(thickness: 2),
              Row(children: [
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
