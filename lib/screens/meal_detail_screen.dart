import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            stretch: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                meal.title,
              ),
              titlePadding: const EdgeInsets.all(16),
              background: Stack(fit: StackFit.expand, children: [
                Image(
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, 0.5),
                      end: Alignment.center,
                      colors: <Color>[
                        Color(0x80000000),
                        Color(0x00000000),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Text(
              meal.ingredients[index],
              style: const TextStyle(color: Colors.white),
            );
          }, childCount: meal.ingredients.length)),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return Row(
              children: [
                Text(
                  '${index + 1}. ',
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  meal.steps[index],
                  style: const TextStyle(color: Colors.white),
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ],
            );
          }, childCount: meal.steps.length)),
        ],
      ),
    );
  }
}
