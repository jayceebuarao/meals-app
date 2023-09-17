import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsListItem extends StatelessWidget {
  const MealsListItem({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                height: 200,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 16),
            Text(meal.title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
