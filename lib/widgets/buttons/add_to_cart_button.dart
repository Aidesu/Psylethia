import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final Function onTap;
  final Color foregroundColor;
  final Color backgroundColor;

  const AddToCartButton({
    super.key,
    required this.onTap,
    this.foregroundColor = Colors.black,
    this.backgroundColor = Colors.orangeAccent,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(170, 40)),
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
      ),
      onPressed: () => onTap(),
      child: Text('Ajouter au panier'),
    );
  }
}
