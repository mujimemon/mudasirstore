import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryIcon({
    required this.imagePath,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 50,
          height: 50,
        ),
        const SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}
