import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/product_model.dart';
import '../../../viewmodel/cart_page_view_model.dart';

class CartCard extends StatelessWidget {
  final Mushroom item;
  const CartCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.read<CartViewModel>();

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
            children: [
              _buildImage(),
              const SizedBox(width: 12),
              Expanded(child: _buildProductInfo(cart)),
            ],
          ),

          const SizedBox(height: 12),

          _buildActionSection(cart),
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

  Widget _buildProductInfo(CartViewModel cart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        const SizedBox(height: 6),

        _buildRating(),
        const SizedBox(height: 6),

        Text(
          "${item.rate.toStringAsFixed(0)}00+ bought in the past day",
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
        const SizedBox(height: 6),

        if (item.choice) _buildChoiceTag(),
        const SizedBox(height: 10),

        _buildPrice(),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      item.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Text(item.rate.toStringAsFixed(1)),
        const SizedBox(width: 4),
        ...List.generate(5, (i) => _buildStar(i)),
        Text(" (${item.customersRate})"),
      ],
    );
  }

  Icon _buildStar(int index) {
    final full = index + 1;
    final half = index + 0.5;

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

  Widget _buildChoiceTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF6B3F69),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "Black friday deal",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _buildPrice() {
    final oldPrice = item.price * (1 + item.discount / 100);

    return Row(
      children: [
        Text(
          "€${item.price.toStringAsFixed(2)}",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 6),
        Text(
          "€${oldPrice.toStringAsFixed(2)}",
          style: const TextStyle(
            fontSize: 13,
            decoration: TextDecoration.lineThrough,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildActionSection(CartViewModel cart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _iconButton(Icons.delete_outline, () => cart.remove(item)),

            _iconButton(
              Icons.remove_circle_outline,
              () => cart.decreaseQuantity(item),
            ),

            Text(
              item.quantity.toString(),
              style: const TextStyle(fontSize: 18),
            ),

            _iconButton(
              Icons.add_circle_outline,
              () => cart.increaseQuantity(item),
            ),

            const SizedBox(width: 8),
            _textButton("Delete"),
            const SizedBox(width: 8),
            _textButton("Save for later"),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            _textButton("See more like this"),
            const SizedBox(width: 8),
            _textButton("Share"),
          ],
        ),
      ],
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
    );
  }

  Widget _textButton(String text) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
