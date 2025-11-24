import 'package:flutter/material.dart';
import '../components/layouts/bottom_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psylethia'),
        backgroundColor: Color(0xFFA376A2),
      ),
      // bottomNavigationBar: BottomBar(),
      body: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Shop by category',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(thickness: 2),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    final List category = [
                      {'name': 'Deadly', 'img': 'deadly_mushroom.png'},
                      {'name': 'Toxic', 'img': 'toxic_mushroom.png'},
                    ];

                    return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/category/view',
                      ), //print('UwU from ${category[index]['name']}')
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(67, 0, 0, 0),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 5),
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category[index]['name'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                child: Image.asset(
                                  'assets/images/category/${category[index]['img']}',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
