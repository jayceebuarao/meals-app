import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:material_symbols_icons/symbols.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;

  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            // stretch: true,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                meal.title,
                // textAlign: TextAlign.center,
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
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
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  onToggleFavorite(meal);
                },
                icon: const Icon(
                  Icons.star_rounded,
                  color: Colors.white,
                  size: 32,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 10.0)
                  ],
                ),
              )
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Ingredients',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                  child: Text(
                    meal.ingredients[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              childCount: meal.ingredients.length,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Instructions',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                  child: Text(
                    '${index + 1}. ${meal.steps[index]}',
                    style: const TextStyle(color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  ),
                );
              },
              childCount: meal.steps.length,
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Icon(
                Symbols.cooking_rounded,
                size: 75,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
