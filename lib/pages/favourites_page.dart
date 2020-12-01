import 'package:flutter/material.dart';
import 'package:racipe_app/models/meals.dart';
import '../widgets/meal_item.dart';

class FavouritesPage extends StatelessWidget {
  List<Meal> favouriteMeals;

  FavouritesPage(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Container(
        child: Text('no faourite meals ye, add one'),
      );
    } else {
      return (ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            affordability: favouriteMeals[index].affordability,
            complexity: favouriteMeals[index].complexity,
            duration: favouriteMeals[index].duration,
            // removeItem: _removeMeal
          );
        },
        itemCount: favouriteMeals.length,
      ));
    }
  }
}
