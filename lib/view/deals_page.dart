import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/widgets/app_bar/app_bar.dart';
import 'package:psylethia/components/widgets/card/product_card.dart';
import '../viewmodel/mushroom_view_model.dart';
import '../components/widgets/app_bar/bottom_bar.dart';

class DealsPage extends StatelessWidget {
  final String category;
  final double price;
  const DealsPage({this.category = '', this.price = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = MushroomsViewModel();
        vm.fetchMushrooms().then(
          (_) => {
            if (category == '') {} else {vm.filterName(category)},
            if (price == 0) {} else {vm.filterPrice(price)},
          },
        );
        return vm;
      },

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Consumer<MushroomsViewModel>(
            builder: (context, vm, _) => const MyAppBar(),
          ),
        ),

        body: Consumer<MushroomsViewModel>(
          builder: (context, vm, _) {
            return GridView.builder(
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 en rangée
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.52,
              ),
              itemCount: vm.mushrooms.length,
              itemBuilder: (context, index) {
                final m = vm.mushrooms[index];
                return ProductCard(mushroom: m);
              },
            );
          },
        ),
        bottomNavigationBar: MyBottomNavBar(
          currentIndex: 0,
          onTap: (int value) {},
        ),
      ),
    );
  }
}
