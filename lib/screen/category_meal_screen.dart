import 'package:deli_meals_app/model/meal.dart';
import 'package:deli_meals_app/widget/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/catagory-meals';
  final List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String? catagoryTitle;
  late List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final catagoryTitle = routeArgs['title'];
      final catagoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(catagoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(catagoryTitle ?? ''),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: displayedMeals[index].id,
              affordability: displayedMeals[index].affordability,
              complexity: displayedMeals[index].complexity,
              duration: displayedMeals[index].duration ?? 0,
              imageUrl: displayedMeals[index].imageUrl,
              title: displayedMeals[index].title);
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
