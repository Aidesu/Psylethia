import 'package:flutter/material.dart';
import '../model/product_model.dart';
import 'package:psylethia/components/layouts/bottom_bar.dart';

class ProductsPage extends StatelessWidget {
  final Mushroom mushroom;

  ProductsPage({required this.mushroom, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${mushroom.name}'),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
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
                            mushroom.name,
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
                          Text('${mushroom.rate.toStringAsFixed(2)}'),
                          SizedBox(width: 3),
                          Icon(
                            (mushroom.rate as num) >= 0.09
                                ? mushroom.rate >= 0.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 1.09
                                ? mushroom.rate >= 1.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 2.09
                                ? mushroom.rate >= 2.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 3.09
                                ? mushroom.rate >= 3.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),
                          Icon(
                            (mushroom.rate as num) >= 4.09
                                ? mushroom.rate >= 4.5
                                      ? Icons.star_rounded
                                      : Icons.star_half_rounded
                                : Icons.star_outline_rounded,
                            color: Colors.deepOrange,
                            size: 23,
                          ),

                          SizedBox(width: 3),
                          Text('(${mushroom.customersRate})'),
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
                        '${mushroom.name} ${mushroom.commonname} ${mushroom.agent}',
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
                  child: Image.network(mushroom.img as String),
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
                      '-${mushroom.discount}%',
                      style: TextStyle(color: Color(0xFFA376A2), fontSize: 30),
                    ),
                    SizedBox(width: 10),
                    Text('\$', style: TextStyle(fontSize: 20)),
                    SizedBox(width: 2),
                    Text(
                      '${mushroom.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Lowest price in last 30 days: '),
                    Text(
                      '\$${((((mushroom.price as num?) ?? 0) * (1 + mushroom.discount / 100)).toStringAsFixed(1))}',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
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
                    Expanded(child: Text('Soon...')), //! $mushroom.type
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(child: Text('Distribution')),
                    Expanded(child: Text('Global')),
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
