import 'package:flutter/material.dart';
import 'package:psylethia/components/layouts/app_bar.dart';

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
    "rate": 4.5,
    "customersRate": 25,
    "discount": 10,
    "choice": true,
  };

  ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psylethia'),
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('${testProduct['rate']}'),
                          SizedBox(width: 3),
                          Icon(Icons.star, size: 20, color: Colors.deepOrange),
                          Icon(Icons.star, size: 20, color: Colors.deepOrange),
                          Icon(Icons.star, size: 20, color: Colors.deepOrange),
                          Icon(Icons.star, size: 20, color: Colors.deepOrange),
                          Icon(Icons.star, size: 20, color: Colors.deepOrange),
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
                    IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.share)),
                  ],
                ),
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange,
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
                          color: Colors.deepOrangeAccent,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
