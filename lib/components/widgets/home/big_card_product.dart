import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/viewmodel/cart_page_view_model.dart';
import '../../../model/product_model.dart';
import '../../../view/products_page.dart';
import '../buttons/add_to_cart_button.dart';

class BigCardProduct extends StatelessWidget {
  final Mushroom mushroom;
  const BigCardProduct({required this.mushroom, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ProductsPage(mushroom: mushroom)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: mushroom.img == ''
                  ? Image.asset('assets/images/no_image.png')
                  : Image.network(mushroom.img, fit: BoxFit.cover),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color(0xFF8D5F8C),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${mushroom.discount}% off',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
