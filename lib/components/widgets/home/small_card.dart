import 'package:flutter/material.dart';
import '../../../view/deals_page.dart';

class SmallCard extends StatelessWidget {
  final String text;
  const SmallCard({this.text = "no text", super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DealsPage(category: text)),
      ),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 90,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xFF8D5F8C),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/psylethia_logo.png'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(text, style: TextStyle(fontSize: 16))],
          ),
        ],
      ),
    );
  }
}
