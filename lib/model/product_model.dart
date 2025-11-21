class Mushroom {
  // final int id;
  final String name;
  final String commonname;
  // final double price;
  final String agent;
  // final String distribution;
  final String img;
  final String type;
  // final int stock;
  // final double rate;
  // final int customersRate;
  // final int discount;
  // final bool choice;

  Mushroom({
    // required this.id,
    required this.name,
    required this.commonname,
    // required this.price,
    required this.agent,
    // required this.distribution,
    required this.img,
    required this.type,
    // required this.stock,
    // required this.rate,
    // required this.customersRate,
    // required this.discount,
    // required this.choice,
  });

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
      // stock: json['stock'],
      // rate: json['rate'],
      // customersRate: json['customersRate'],
      // discount: json['discount'],
      // choice: json['choice'],
    );
  }
}
