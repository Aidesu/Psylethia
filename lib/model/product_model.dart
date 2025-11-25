import 'dart:math';

class Mushroom {
  int id;
  final String name;
  final String commonname;
  final double price;
  final String agent;
  final String img;
  final String type;
  final int stock;
  final double rate;
  final int customersRate;
  final int discount;
  final bool choice;
  int quantity;

  Mushroom({
    required this.id,
    required this.name,
    required this.commonname,
    required this.price,
    required this.agent,
    required this.img,
    required this.type,
    required this.stock,
    required this.rate,
    required this.customersRate,
    required this.discount,
    required this.choice,
    this.quantity = 1,
  });

  Mushroom copy() {
    return Mushroom(
      id: id,
      name: name,
      commonname: commonname,
      price: price,
      agent: agent,
      img: img,
      type: type,
      stock: stock,
      rate: rate,
      customersRate: customersRate,
      discount: discount,
      choice: choice,
      quantity: quantity,
    );
  }

  factory Mushroom.fromJson(Map<String, dynamic> json) {
    return Mushroom(
      id: 0,
      name: json['name'],
      commonname: json['commonname'],
      agent: json['agent'],
      img: json['img'],
      type: json['type'],
      price: 12.49 + Random().nextDouble() * (79.99 - 12.49),
      rate: 2 + Random().nextDouble() * 3,
      customersRate: Random().nextInt(255),
      stock: Random().nextInt(100) + 50,
      discount: Random().nextInt(25),
      choice: Random().nextBool(),

      quantity: json['quantity'] != null ? json['quantity'] as int : 1,
    );
  }
}
