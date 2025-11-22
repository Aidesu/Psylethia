import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/mushroom_view_model.dart';
import '../widgets/buttons/add_to_cart_button.dart';
import '../widgets/buttons/view_product_button.dart';
import '../widgets/app_bar/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = MushroomsViewModel();
        vm.fetchMushrooms();
        return vm;
      },

      child: Scaffold(
        appBar: const MyAppBar(),

        body: Consumer<MushroomsViewModel>(
          builder: (context, vm, _) {
            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 en rangée
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.80,
              ),
              itemCount: vm.mushrooms.length,
              itemBuilder: (context, index) {
                final m = vm.mushrooms[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      // image du champignon ------------------- clipRRect = rectangle du produit
                      Expanded(child: ClipRRect(child: Image.network(m.img))),

                      // Nom du champignon -------------------
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          m.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      // Bouton voir le produit avec widget button -------------------
                      Padding(
                        padding: const EdgeInsets.only(bottom: 3),
                        child: ViewProductButton(
                          onTap: () {
                            print('Redirection vers le produit');
                          },
                          foregroundColor: null,
                        ),
                      ),

                      // Bouton ajouter au panier avec widget button -------------------
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: AddToCartButton(
                          onTap: () {
                            print('Ajouté au panier !');
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
