// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:racipe_app/data.dart';

class MealsDetailPage extends StatelessWidget {
  static const routeName = '/meals-detail';
  final Function toggleFavourite;
  final Function isFaouriteMeal;

  MealsDetailPage(this.isFaouriteMeal, this.toggleFavourite);

  @override
  Widget sectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: (BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      )),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child,
    );
  }

  Widget build(BuildContext context) {
    final ID = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((element) => element.id == ID);
    return Scaffold(
      appBar: AppBar(
        title: Text('$ID'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            sectionTitle(context, "ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(ctx).accentColor,
                  child: Text(selectedMeal.ingredients[index]),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            sectionTitle(context, "steps"),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFaouriteMeal(ID) ? (Icons.star) : (Icons.star_border),
        ),
        onPressed: () {
          toggleFavourite(ID);
        },
      ),
    );
  }
}
