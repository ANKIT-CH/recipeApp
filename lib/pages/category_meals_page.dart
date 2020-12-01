import 'package:flutter/material.dart';
import 'package:racipe_app/models/categories.dart';
import 'package:racipe_app/models/meals.dart';

// import '../data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsPage extends StatefulWidget {
  static const routeName = '\category-meals';
  final List<Meal> availableMeals;

  CategoryMealsPage(this.availableMeals);

  @override
  _CategoryMealsPageState createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  String categoryTitle;
  List<Meal> totalCategoryMeals;
  var _oncechanged = false;
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    if (!_oncechanged) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String categoryId = routeArguments['id'];
      categoryTitle = routeArguments['title'];

      totalCategoryMeals = widget.availableMeals.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _oncechanged = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      totalCategoryMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: totalCategoryMeals[index].id,
            title: totalCategoryMeals[index].title,
            imageUrl: totalCategoryMeals[index].imageUrl,
            affordability: totalCategoryMeals[index].affordability,
            complexity: totalCategoryMeals[index].complexity,
            duration: totalCategoryMeals[index].duration,
            // removeItem: _removeMeal
          );
        },
        itemCount: totalCategoryMeals.length,
      ),
    );
  }
}
