import 'package:flutter/material.dart';
import 'package:psylethia/components/layouts/app_bar.dart';
import 'package:psylethia/components/layouts/bottom_bar.dart';

class ProductsPage extends StatelessWidget {
  final testProduct = {
    "id": "1",
    "name": "Psilocybe semilanceata",
    "commonname": "Liberty cap",
    "agent": "psilocybin, psilocin, and baeocystin",
    "distribution": ["North America", "Europe", "Asia", "Australia"],
    "img":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Psilocybe_semilanceata_250px.jpg/500px-Psilocybe_semilanceata_250px.jpg",
    "type": "poisonous",
    "price": 25.99,
    "stock": 126,
    "rate": 3.2,
    "customersRate": 25,
    "discount": 10,
    "choice": true,
  };

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${testProduct['name']}'),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xFFA376A2),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            testProduct['name'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${testProduct['rate']}'),
                          SizedBox(width: 3),
                          Icon(
                            (testProduct['rate'] as num) >= 1
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (testProduct['rate'] as num) >= 2
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (testProduct['rate'] as num) >= 3
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (testProduct['rate'] as num) >= 4
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (testProduct['rate'] as num) >= 5
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),

                          SizedBox(width: 3),
                          Text('(${testProduct['customersRate']})'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${testProduct['name']} ${testProduct['commonname']} ${testProduct['agent']}',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                  child: Image.network(testProduct['img'] as String),
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border_outlined),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      '-${testProduct['discount']}%',
                      style: TextStyle(color: Color(0xFFA376A2), fontSize: 30),
                    ),
                    SizedBox(width: 10),
                    Text('\$', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 2),
                    Text(
                      '${testProduct['price']}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Lowest price in last 30 days: \$${((((testProduct['price'] as num?) ?? 0) * 1.25).toStringAsFixed(2))}',
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'The prices of products sold on Psylethia include VAT. Depending on your delivery address, VAT may varv at the checkout. For more information, click here',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      'In stock',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // DropdownButton(
                //   items: const [
                //     DropdownMenuItem(child: Text('Quantity :'), value: 1),
                //     DropdownMenuItem(child: Text('2'), value: 2),
                //     DropdownMenuItem(child: Text('3'), value: 3),
                //     DropdownMenuItem(child: Text('4'), value: 4),
                //     DropdownMenuItem(child: Text('5'), value: 5),
                //     DropdownMenuItem(child: Text('10'), value: 10),
                //     DropdownMenuItem(child: Text('20'), value: 20),
                //     DropdownMenuItem(child: Text('30'), value: 30),
                //   ],
                //   onChanged: print,
                // ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFA376A2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Add to Basket',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF8D5F8C),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Shipper / Seller'), flex: 2),
                    Expanded(child: Text('Psylethia'), flex: 3),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Returns'), flex: 2),
                    Expanded(
                      child: Text(
                        'Return a product until 31 January 2026 or within 30 days from receip (wchichever is later)',
                      ),
                      flex: 3,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Gift options'), flex: 2),
                    Expanded(child: Text('Available at checkout'), flex: 3),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Text('Payment'), flex: 2),
                    Expanded(child: Text('Secure transaction'), flex: 3),
                  ],
                ),
                Divider(thickness: 2, height: 50),
                Row(
                  children: [
                    Text(
                      "Product details",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Text(
                      'Product specification',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(child: Text('Type')),
                    Expanded(child: Text('${testProduct['type'] ?? 'Unknow'}')),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(child: Text('Distribution')),
                    Expanded(
                      child: Text(testProduct['distribution'].toString()),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
