import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/layouts/bottom_bar.dart';
import 'package:psylethia/components/widgets/card/product_card.dart';
import 'package:psylethia/view/products_page.dart';
import '../viewmodel/mushroom_view_model.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

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
          title: const Text('TEST'),
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
                childAspectRatio: 0.40,
              ),
              itemCount: vm.mushrooms.length,
              itemBuilder: (context, index) {
                final m = vm.mushrooms[index];

                return ProductCard(mushroom: m);
              },
            );
          },
        ),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}
