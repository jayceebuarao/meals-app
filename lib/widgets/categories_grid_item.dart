import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoriesGridItem extends StatelessWidget {
  const CategoriesGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final Category category;
  final Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.80),
                category.color.withOpacity(0.24)
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            )),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
