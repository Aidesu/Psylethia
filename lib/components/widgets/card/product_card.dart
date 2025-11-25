import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/viewmodel/cart_page_view_model.dart';
import '../../../model/product_model.dart';
import '../../../view/products_page.dart';
import '../buttons/add_to_cart_button.dart';

class ProductCard extends StatelessWidget {
  final Mushroom mushroom;
  const ProductCard({required this.mushroom, super.key});

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
          border: Border.all(
            width: 1,
            color: const Color.fromARGB(31, 29, 29, 29),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: mushroom.img == ""
                  ? Image.asset('assets/images/no_image.png')
                  : Image.network(mushroom.img, fit: BoxFit.cover),
            ),
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              mushroom.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(mushroom.rate.toStringAsFixed(1)),

                          Icon(
                            (mushroom.rate as num) >= 0.09
                                ? mushroom.rate > 0.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 16,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 1.09
                                ? mushroom.rate > 1.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 16,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 2.09
                                ? mushroom.rate > 2.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 16,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 3.09
                                ? mushroom.rate >= 3.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 16,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 4.09
                                ? mushroom.rate >= 4.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 16,
                          ),
                          Text('(${mushroom.customersRate})'),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(mushroom.rate.toStringAsFixed(0)),
                          Expanded(child: Text('00+ bought in past month')),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    mushroom.choice
                        ? Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF6B3F69),
                                    borderRadius: BorderRadius.circular(3),
                                  ),

                                  child: Text(
                                    'Black friday deal',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Text(
                            '\$',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            mushroom.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '(\$${mushroom.price.toStringAsFixed(2)}/kg)',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'Lowest: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '\$${((((mushroom.price as num?) ?? 0) * (1 + mushroom.discount / 100)).toStringAsFixed(1))}',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AddToCartButton(
                            onTap: () {
                              context.read<CartViewModel>().add(mushroom);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
