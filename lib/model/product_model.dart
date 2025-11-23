import 'dart:math';

class Mushroom {
  // final int id;
  final String name;
  final String commonname;
  final double price;
  final String agent;
  // final String distribution;
  final String img;
  final String type;
  final int stock;
  final double rate;
  final int customersRate;
  final int discount;
  final bool choice;

  Mushroom({
    // required this.id,
    required this.name,
    required this.commonname,
    required this.agent,
    // required this.distribution,
    required this.img,
    required this.type,
  }) : stock = Random().nextInt(100) + 50,
       rate = 2 + Random().nextDouble() * (5 - 2),
       customersRate = Random().nextInt(255),
       price = 12.49 + Random().nextDouble() * (79.99 - 12.49),
       choice = Random().nextBool(),
       discount = Random().nextInt(25);

  factory Mushroom.fromJson(Map<String, dynamic> json) {
    return Mushroom(
      // id: json['id'],
      name: json['name'],
      commonname: json['commonname'],
      // price: (json['price'] as num).toDouble(),
      agent: json['agent'],
      // distribution: json['distribution'],
      img: json['img'],
      type: json['type'],
      // stock: ,
      // rate: json['rate'],
      // customersRate: json['customersRate'],
      // discount: json['discount'],
      // choice: json['choice'],
    );
  }
}
