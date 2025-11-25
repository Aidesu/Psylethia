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
    return Container(
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductsPage(mushroom: mushroom),
                ),
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,

            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: mushroom.img == ""
                      ? Image.asset('assets/images/no_image.png')
                      : Image.network(mushroom.img, fit: BoxFit.cover),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // Nom
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          mushroom.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(mushroom.rate.toStringAsFixed(1)),
                          const SizedBox(width: 4),

                          ...List.generate(5, (i) {
                            double threshold = i + 0.09;
                            return Icon(
                              mushroom.rate >= threshold
                                  ? (mushroom.rate >= i + 0.5
                                        ? Icons.star_rounded
                                        : Icons.star_half_rounded)
                                  : Icons.star_outline_rounded,
                              color: Colors.deepOrange,
                              size: 16,
                            );
                          }),

                          const SizedBox(width: 4),
                          Text("(${mushroom.customersRate})"),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(mushroom.rate.toStringAsFixed(0)),
                          const SizedBox(width: 4),
                          const Expanded(
                            child: Text("00+ bought in past month"),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      // Badge
                      if (mushroom.choice)
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6B3F69),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: const Text(
                            'Black friday deal',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      const SizedBox(height: 6),

                      // Prix
                      Row(
                        children: [
                          const Text('\$'),
                          Text(
                            mushroom.price.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            ' (\$${mushroom.price.toStringAsFixed(2)}/kg)',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          const Text(
                            'Lowest: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            '\$${(mushroom.price * (1 + mushroom.discount / 100)).toStringAsFixed(1)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: AddToCartButton(
              onTap: () {
                print("[DEBUG] Bouton Add → Ajout au panier");
                context.read<CartViewModel>().add(mushroom);
              },
            ),
          ),
        ],
      ),
    );
  }
}
