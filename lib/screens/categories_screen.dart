import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/widgets/categories_grid_item.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

/**
 * @desc when category is selected, take in type Category parameter of selected category
 * and sort through all meals under that category and store to List of type Meal 'categorizedMeal'
 * 
 * Navigate to MealsScreen with sorted list of meals
 */
  void _selectCategory(BuildContext context, Category category) {
    List<Meal> categorizedMeal = availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MealsScreen(
        title: category.title,
        meals: categorizedMeal,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      children: [
        for (final category in availableCategories)
          CategoriesGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
