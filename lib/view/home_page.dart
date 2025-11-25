import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psylethia/components/widgets/card/product_card.dart';
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
    return ChangeNotifierProvider(
      create: (_) {
        final vm = MushroomsViewModel();
        vm.fetchMushrooms();
        return vm;
      },

      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Consumer<MushroomsViewModel>(
            builder: (context, vm, _) => MyAppBar(onSearch: vm.filter),
          ),
        ),
        body: Consumer<MushroomsViewModel>(
          builder: (context, vm, _) {
            if (vm.allMushrooms.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 800,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF6B3F69),
                          const Color(0xFF8D5F8C),
                          const Color(0xFF8D5F8C),
                          const Color(0xFFDDC3C3),
                          Colors.white,
                          Colors.white,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Expanded(
                          flex: 2,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                BigCard(),
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
                            padding: EdgeInsets.all(10),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
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
                  SizedBox(),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xFFA376A2),
                          height: 60,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                          height: 250,
                          padding: EdgeInsets.all(5),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
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
                  SizedBox(height: 100),
                ],
              ),
            );

            // return GridView.builder(
            //   padding: const EdgeInsets.all(20),
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 1, // 2 en rangée
            //     crossAxisSpacing: 10,
            //     mainAxisSpacing: 10,
            //     childAspectRatio: 0.80,
            //   ),
            //   itemCount: vm.mushrooms.length,
            //   itemBuilder: (context, index) {
            //     final m = vm.mushrooms[index];

            //     // Appel de la carte des mushrooms
            //     return ProductCard(mushroom: m);
            //   },
            // );
          },
        ),
      ),
    );
  }
}
