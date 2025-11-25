import 'package:flutter/material.dart';
import 'package:psylethia/components/widgets/home/big_card_product.dart';
import '../../../model/product_model.dart';

class BigCard4x extends StatelessWidget {
  final Mushroom mushroom_1;
  final Mushroom mushroom_2;
  final Mushroom mushroom_3;
  final Mushroom mushroom_4;
  const BigCard4x({
    required this.mushroom_1,
    required this.mushroom_2,
    required this.mushroom_3,
    required this.mushroom_4,
    super.key,
  });

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
                Expanded(child: BigCardProduct(mushroom: mushroom_1)),
                SizedBox(width: 10),
                Expanded(child: BigCardProduct(mushroom: mushroom_2)),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(child: BigCardProduct(mushroom: mushroom_3)),
                SizedBox(width: 10),
                Expanded(child: BigCardProduct(mushroom: mushroom_4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
