import 'package:flutter/material.dart';

import '../data.dart';
import '../widgets/category_item.dart';

class CategoryLook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(10),
      children: dummyCategories.map((categoryData) {
        return CategoryItem(
          categoryData.id,
          categoryData.title,
          categoryData.color,
        );
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
