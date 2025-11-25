import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/widgets/home/small_card.dart';
import '../viewmodel/mushroom_view_model.dart';
import '../components/widgets/app_bar/app_bar.dart';
import '../components/widgets/home/big_card.dart';
import '../components/widgets/home/medium_card.dart';
import '../components/widgets/home/big_card_4x.dart';

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
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 800,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6B3F69),
                        Color(0xFF8D5F8C),
                        Color(0xFF8D5F8C),
                        Color(0xFFDDC3C3),
                        Colors.white,
                        Colors.white,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              const BigCard(),
                              BigCard4x(
                                mushroom_1: vm.allMushrooms[0],
                                mushroom_2: vm.allMushrooms[1],
                                mushroom_3: vm.allMushrooms[3],
                                mushroom_4: vm.allMushrooms[5],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [
                              MediumCard(text: 'Shop all deals'),
                              MediumCard(text: 'Deals under \$50'),
                              MediumCard(text: 'Deals under \$20'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color(0xFFA376A2),
                        height: 60,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Black Friday Week',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              '20 Nov - 1 Dec',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Row(
                          children: [
                            Text(
                              'Black Friday Week by category',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SmallCard(text: 'Deadly'),
                            SmallCard(text: 'Poisonous'),
                            SmallCard(text: 'Agaricus'),
                            SmallCard(text: 'Amanita'),
                            SmallCard(text: 'Claviceps'),
                            SmallCard(text: 'Coprinopsis'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          );
        },
      ),
    );
  }
}
