import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/widgets/card/product_card.dart';
import '../viewmodel/mushroom_view_model.dart';
import '../components/widgets/app_bar/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),

      body: Consumer<MushroomsViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.mushrooms.isEmpty) {
            return const Center(
              child: Text(
                "Aucun produit trouvé",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.80,
            ),
            itemCount: vm.mushrooms.length,
            itemBuilder: (context, index) {
              final m = vm.mushrooms[index];
              return ProductCard(mushroom: m);
            },
          );
        },
      ),
    );
  }
}
