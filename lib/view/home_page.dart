import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/widgets/home/Big_card_1.dart';
import 'package:psylethia/components/widgets/home/big_card_product.dart';
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
                        Color(0xFFDDC3C3),
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
                              const BigCard(
                                title: 'Gourmet Selection',
                                subTitle: '24 - 25 Nov',

                                content:
                                    'Exceptional mushrooms at unbeatable prices',
                                color: Color(0xFF6B3F69),
                              ),
                              const BigCard(
                                title: 'Epic deals.\nHoliday feels.',
                                content: '',
                                image: 'assets/images/mushroom_2.png',
                                subTitle: '',
                                color: Color(0xFF8D5F8C),
                              ),
                              BigCard4x(
                                text: "Don't miss these deals",
                                mushroom_1: vm.allMushrooms[0],
                                mushroom_2: vm.allMushrooms[1],
                                mushroom_3: vm.allMushrooms[119],
                                mushroom_4: vm.allMushrooms[5],
                              ),
                              const BigCard(
                                title: 'Most loved: Mushrooms',
                                content: '',
                                subTitle: '',
                                image: 'assets/images/mushroom_1.png',
                                color: Color(0xFF8D5F8C),
                              ),
                              BigCard4x(
                                text: "Shop big savings for you",
                                mushroom_1: vm.allMushrooms[6],
                                mushroom_2: vm.allMushrooms[48],
                                mushroom_3: vm.allMushrooms[8],
                                mushroom_4: vm.allMushrooms[99],
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
                              MediumCard(
                                text: 'Shop all deals',
                                image: 'assets/images/psylethia_cart.png',
                              ),
                              MediumCard(
                                text: 'Deals under \$50',
                                image: 'assets/images/mushroom_bag.png',
                                price: 50,
                              ),
                              MediumCard(
                                text: 'Deals under \$20',
                                image: 'assets/images/mushroom_bag.png',
                                price: 20,
                              ),
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
                  margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
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
                      Container(
                        width: double.infinity,
                        height: 150,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            SmallCard(text: 'Agaricus'),
                            SmallCard(text: 'Amanita'),
                            SmallCard(text: 'Claviceps'),
                            SmallCard(text: 'Coprinopsis'),
                            SmallCard(text: 'Galerina'),
                            SmallCard(text: 'Clitocybe'),
                            SmallCard(text: 'Cudonia'),
                            SmallCard(text: 'Claviceps'),
                            SmallCard(text: 'Coprinopsis'),
                            SmallCard(text: 'Cortinarius'),
                            SmallCard(text: 'Entoloma'),
                            SmallCard(text: 'Gyromitra'),
                            SmallCard(text: 'Ampulloclitocybe'),
                            SmallCard(text: 'Chlorophyllum'),
                            SmallCard(text: 'Echinoderma'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Row(
                          children: [
                            Text(
                              'Black Friday deals for you',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 450,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            BigCard1(
                              text: 'Cortinarius mushrooms',
                              mushroom1: vm.allMushrooms[50],
                              mushroom2: vm.allMushrooms[51],
                              mushroom3: vm.allMushrooms[52],
                              mushroom4: vm.allMushrooms[54],
                            ),
                            BigCard1(
                              text: 'Helvella mushrooms',
                              mushroom1: vm.allMushrooms[84],
                              mushroom2: vm.allMushrooms[85],
                              mushroom3: vm.allMushrooms[86],
                              mushroom4: vm.allMushrooms[87],
                            ),
                            BigCard1(
                              text: 'Amanita mushrooms',
                              mushroom1: vm.allMushrooms[27],
                              mushroom2: vm.allMushrooms[32],
                              mushroom3: vm.allMushrooms[38],
                              mushroom4: vm.allMushrooms[39],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 35),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Row(
                          children: [
                            Text(
                              'Deals to discover',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 450,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            BigCard1(
                              text: 'Cortinarius mushrooms',
                              mushroom1: vm.allMushrooms[50],
                              mushroom2: vm.allMushrooms[51],
                              mushroom3: vm.allMushrooms[52],
                              mushroom4: vm.allMushrooms[54],
                            ),
                            BigCard1(
                              text: 'Helvella mushrooms',
                              mushroom1: vm.allMushrooms[84],
                              mushroom2: vm.allMushrooms[85],
                              mushroom3: vm.allMushrooms[86],
                              mushroom4: vm.allMushrooms[87],
                            ),
                            BigCard1(
                              text: 'Amanita mushrooms',
                              mushroom1: vm.allMushrooms[27],
                              mushroom2: vm.allMushrooms[32],
                              mushroom3: vm.allMushrooms[38],
                              mushroom4: vm.allMushrooms[39],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Container(
                  width: double.infinity,
                  height: 450,
                  child: BigCard1(
                    text: 'More deals to consider',
                    radius: 0,
                    mushroom1: vm.allMushrooms[128],
                    mushroom2: vm.allMushrooms[129],
                    mushroom3: vm.allMushrooms[122],
                    mushroom4: vm.allMushrooms[124],
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
