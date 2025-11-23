import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/cart_page_view_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier")),

      body: Consumer<CartViewModel>(
        builder: (context, cart, _) {
          if (cart.items.isEmpty) {
            return const Center(child: Text("Votre panier est vide"));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];

              return ListTile(
                title: Text(item.name),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cart.remove(item);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
