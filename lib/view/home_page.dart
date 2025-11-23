import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/layouts/bottom_bar.dart';
import 'package:psylethia/view/products_page.dart';
import '../viewmodel/mushroom_view_model.dart';

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
        appBar: AppBar(
          title: const Text('Psylethia'),
          backgroundColor: Color(0xFFA376A2),
        ),

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

                      // Bouton voir le produit -------------------
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProductsPage(mushroom: m),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            // vm.mushrooms[index]
                            backgroundColor: const Color(0xFFA376A2),
                            foregroundColor: Colors.black,
                          ),
                          child: const Text(
                            "Voir le produit",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
