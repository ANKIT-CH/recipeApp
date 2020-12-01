import 'package:flutter/material.dart';

import '../data.dart';
import '../models/meals.dart';
import '../pages/meals_detail_page.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    // @required this.removeItem,
  });

  String get complexityString {
    switch (complexity) {
      case Complexity.Simple:
        return 'simple';
      case Complexity.Challenging:
        return 'challenging';
      case Complexity.Hard:
        return 'hard';
      default:
        return 'unknown';
    }
  }

  String get affordabilityString {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
      case Affordability.Pricey:
        return 'pricey';
      case Affordability.Luxurious:
        return 'luxurious';
      default:
        return 'unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealsDetailPage.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 5,
                  child: Container(
                    width: 250,
                    color: Colors.black45,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(complexityString),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(affordabilityString),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
