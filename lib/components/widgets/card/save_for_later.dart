import 'package:flutter/material.dart';
import '../../../model/product_model.dart';

class SaveForLaterCard extends StatelessWidget {
  final Mushroom item;

  final VoidCallback onMoveToCart;
  final VoidCallback onDelete;

  const SaveForLaterCard({
    super.key,
    required this.item,
    required this.onMoveToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              Expanded(child: _buildProductInfo()),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            "Eligible for FREE Shipping",
            style: TextStyle(
              color: Colors.green,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _actionButton("Delete", onDelete),
              const SizedBox(width: 10),
              _actionButton("Move to basket", onMoveToCart),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        item.img,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductInfo() {
    final double oldPrice = item.price * (1 + item.discount / 100);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Text(item.rate.toStringAsFixed(1)),
            const SizedBox(width: 4),
            ...List.generate(5, (i) => _buildStar(i)),
            const SizedBox(width: 4),
            Text("(${item.customersRate})"),
          ],
        ),

        const SizedBox(height: 6),

        Text(
          "${item.rate.toStringAsFixed(0)}00+ bought in past month",
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),

        const SizedBox(height: 6),

        if (item.choice)
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFF6B3F69),
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Text(
              "Black friday deal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

        const SizedBox(height: 8),

        Row(
          children: [
            Text(
              "€${item.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Text(
              "€${oldPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Icon _buildStar(int index) {
    final int full = index + 1;
    final double half = index + 0.5;

    return Icon(
      item.rate >= full
          ? Icons.star_rounded
          : item.rate >= half
          ? Icons.star_half_rounded
          : Icons.star_outline_rounded,
      color: Colors.deepOrange,
      size: 18,
    );
  }

  Widget _actionButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
