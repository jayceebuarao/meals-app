import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.icon,
    required this.trait,
  });

  final IconData icon;
  final String trait;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 12),
        const SizedBox(width: 2),
        Text(trait, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const SizedBox(width: 12),
      ],
    );
  }
}
