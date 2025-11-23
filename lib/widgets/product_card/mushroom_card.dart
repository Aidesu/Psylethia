import 'package:flutter/material.dart';
import 'package:psylethia/model/product_model.dart';
import 'package:psylethia/widgets/buttons/add_to_cart_button.dart';
import 'package:psylethia/widgets/buttons/view_product_button.dart';

class ProductCard extends StatelessWidget {
  final Mushroom mushroom;

  const ProductCard({super.key, required this.mushroom});

  @override
  Widget build(BuildContext context) {
    final m = mushroom;

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(68, 255, 172, 64),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color.fromARGB(113, 255, 172, 64)),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.network(m.img, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 8),
          Text(m.name),
          const SizedBox(height: 8),
          Text(m.type),
          Row(
            children: [
              Expanded(
                // appel du bouton ajouté produit
                child: ViewProductButton(
                  onTap: () => print('Redirection vers ${m.name}'),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                // appel du bouton ajouté produit
                child: AddToCartButton(
                  onTap: () => print('${m.name} ajouté au panier'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
