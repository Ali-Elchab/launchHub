import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(this.text, this.onPressed,
      {this.showArrow = true, super.key});
  final String text;
  final bool showArrow;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            backgroundColor: const Color(0xFF326789),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              if (showArrow)
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}
