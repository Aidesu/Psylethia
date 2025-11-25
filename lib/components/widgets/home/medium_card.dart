import 'package:flutter/material.dart';
import '../../../view/deals_page.dart';

class MediumCard extends StatelessWidget {
  final double price;
  final String text;
  final String image;
  const MediumCard({
    this.price = 0,
    this.image = 'assets/images/psylethia_logo.png',
    this.text = "no text",
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DealsPage(price: price)),
      ),
      child: Container(
        height: 200,
        width: 160,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
          color: Color(0xFF8D5F8C),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ),
            Expanded(flex: 3, child: Image.asset(image)),
          ],
        ),
      ),
    );
  }
}
