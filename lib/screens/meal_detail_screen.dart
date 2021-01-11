import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {Key key, this.setFavoriteHandler, this.isMealFavoriteHandler})
      : super(key: key);
  static const String routeName = "/meal-detail";

  final Function setFavoriteHandler;
  final Function isMealFavoriteHandler;

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text("Meal"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, i) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text(
                        meal.ingredients[i],
                      ),
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(
                            "# ${(i + 1).toString()}",
                          ),
                        ),
                        title: Text(
                          meal.steps[i],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: meal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavoriteHandler(mealId)
            ? Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
        onPressed: () {
          setFavoriteHandler(mealId);
        },
      ),
    );
  }
}
