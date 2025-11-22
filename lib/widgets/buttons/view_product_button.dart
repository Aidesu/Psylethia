import 'package:flutter/material.dart';

class ViewProductButton extends StatelessWidget {
  final Function onTap;
  final WidgetStateProperty<Color?>? foregroundColor;
  const ViewProductButton({
    super.key,
    required this.onTap,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(Colors.orangeAccent),
        foregroundColor: WidgetStatePropertyAll<Color>(Colors.black),
        fixedSize: WidgetStatePropertyAll(Size(170, 30)),
      ),
      onPressed: () => onTap,
      child: Text('Voir le produit'),
    );
  }
}
