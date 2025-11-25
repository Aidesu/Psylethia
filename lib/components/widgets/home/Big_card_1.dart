import 'package:flutter/material.dart';
import './big_card_product.dart';

class BigCard1 extends StatelessWidget {
  final String text;
  final mushroom1;
  final mushroom2;
  final mushroom3;
  final mushroom4;
  const BigCard1({
    this.text = '',
    required this.mushroom1,
    required this.mushroom2,
    required this.mushroom3,
    required this.mushroom4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xFFA376A2),
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: BigCardProduct(mushroom: mushroom1)),
                      SizedBox(width: 10),
                      Expanded(child: BigCardProduct(mushroom: mushroom2)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: BigCardProduct(mushroom: mushroom3)),
                      SizedBox(width: 10),
                      Expanded(child: BigCardProduct(mushroom: mushroom4)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
