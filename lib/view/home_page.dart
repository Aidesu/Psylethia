import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/widgets/product_card/mushroom_card.dart';
import '../viewmodel/mushroom_view_model.dart';
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
        appBar: MyAppBar(
          onSearch: (text) {
            context.read<MushroomsViewModel>().filter(text);
          },
        ),

        body: Consumer<MushroomsViewModel>(
          builder: (context, vm, _) {
            if (vm.allMushrooms.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            if (vm.mushrooms.isEmpty) {
              return const Center(child: Text("Aucun champignon trouvé."));
            }
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

                // Appel de la carte des mushrooms
                return ProductCard(mushroom: m);
              },
            );
          },
        ),
      ),
    );
  }
}
