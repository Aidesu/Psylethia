import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class ProductCard extends StatelessWidget {
  final Mushroom mushroom;
  const ProductCard({required this.mushroom, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(31, 29, 29, 29),
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(flex: 10, child: Image.network(mushroom.img)),
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
                          (mushroom.rate as num) >= 1
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Icon(
                          (mushroom.rate as num) >= 2
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Icon(
                          (mushroom.rate as num) >= 3
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Icon(
                          (mushroom.rate as num) >= 4
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Icon(
                          (mushroom.rate as num) >= 5
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: Colors.deepOrange,
                          size: 18,
                        ),
                        Text('(${mushroom.customersRate})'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(mushroom.rate.toStringAsFixed(0)),
                        Text('00+ bought in past month'),
                      ],
                    ),
                  ),
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
                            fontSize: 24,
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
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFA376A2),
                            foregroundColor: Colors.black,
                          ),
                          child: Text('Add to basket'),
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
    );
  }
}
