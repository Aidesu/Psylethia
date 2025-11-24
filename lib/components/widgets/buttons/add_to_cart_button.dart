import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  final Function onTap;
  final Color foregroundColor;
  final Color backgroundColor;

  const AddToCartButton({
    super.key,
    required this.onTap,
    this.foregroundColor = Colors.black,
    this.backgroundColor = const Color(0xFFA376A2),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(backgroundColor),
              foregroundColor: WidgetStateProperty.all(foregroundColor),
            ),
            onPressed: () => onTap(),
            child: Text('Add to basket'),
          ),
        ),
      ],
    );
  }
}
