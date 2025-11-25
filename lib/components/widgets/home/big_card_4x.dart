import 'package:flutter/material.dart';

class BigCard4x extends StatelessWidget {
  const BigCard4x({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 350,
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
                  "Don't miss these deals",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.white)),
                SizedBox(width: 10),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.white)),
                SizedBox(width: 10),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
