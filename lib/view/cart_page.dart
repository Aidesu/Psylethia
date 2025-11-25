import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as cart;
import 'package:provider/provider.dart';
import 'package:psylethia/components/widgets/app_bar/app_bar.dart';
import '../viewmodel/cart_page_view_model.dart';
import '../components/widgets/card/cart_card.dart';
import '../components/widgets/card/save_for_later.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),

      body: Consumer<CartViewModel>(
        builder: (context, cart, child) {
          return Padding(
            padding: const EdgeInsets.all(1),
            child: ListView(
              children: [
                _buildSummaryCard(cart),
                const SizedBox(height: 10),

                ...cart.items.map(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CartCard(item: item),
                  ),
                ),

                if (cart.items.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  _buildReturnInfo(),
                ],

                if (cart.saved.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Saved for later",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  ...cart.saved.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: SaveForLaterCard(
                        item: item,
                        onMoveToCart: () => cart.moveToCart(item),
                        onDelete: () => cart.removeFromSaved(item),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSummaryCard(CartViewModel cart) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Subtotal €${cart.totalPrice.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
              const SizedBox(width: 6),

              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: Colors.green, fontSize: 14),
                    children: [
                      TextSpan(text: 'Welcome to Psylethia! '),
                      TextSpan(
                        text: 'FREE Delivery',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' on your first order to France, Belgium and Luxembourg.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 6),

          const Text(
            'Select this option at checkout. Details',
            style: TextStyle(fontSize: 13, color: Colors.black87),
          ),

          const SizedBox(height: 16),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFA376A2),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text("Proceed to checkout (${cart.totalItems} items)"),
          ),
        ],
      ),
    );
  }

  Widget _buildReturnInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Returns are easy",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  "30-day returns on millions of items",
                  style: TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),

          Image.network(
            "https://m.media-amazon.com/images/G/08/x-locale/checkout/returns-box._CB453980378_.png",
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
