import 'package:flutter/material.dart';

class MediumCard extends StatelessWidget {
  final String text;
  const MediumCard({this.text = "no text", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 160,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFF8D5F8C),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Image.asset('assets/images/psylethia_logo.png')),
        ],
      ),
    );
  }
}
