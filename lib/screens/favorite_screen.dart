import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key key, this.favoriteMeals}) : super(key: key);

  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? Center(
            child: Text("You have no favorite yet - start adding some!"),
          )
        : ListView.builder(
            itemBuilder: (ctx, i) {
              return MealItem(
                id: favoriteMeals[i].id,
                title: favoriteMeals[i].title,
                imageUrl: favoriteMeals[i].imageUrl,
                duration: favoriteMeals[i].duration,
                complexity: favoriteMeals[i].complexity,
                affordability: favoriteMeals[i].affordability,
              );
            },
            itemCount: favoriteMeals.length,
          );
  }
}
