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
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(foregroundColor),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
      onPressed: () => onTap(),
      child: Text('Add'),
    );
  }
}
