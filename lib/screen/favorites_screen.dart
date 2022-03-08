import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: favoriteMeals.isEmpty
            ? Center(
                child: Text('No Favorite meal yet---Choose Some'),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return MealItem(
                      id: favoriteMeals[index].id,
                      affordability: favoriteMeals[index].affordability,
                      complexity: favoriteMeals[index].complexity,
                      duration: favoriteMeals[index].duration ?? 0,
                      imageUrl: favoriteMeals[index].imageUrl,
                      title: favoriteMeals[index].title);
                },
                itemCount: favoriteMeals.length,
              ));
  }
}
