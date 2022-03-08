import 'package:deli_meals_app/model/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widget/catagory-item.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: DUMMY_CATEGORIES
            .map((catData) =>
                CategoryItem(catData.title, catData.color, catData.id))
            .toList(),
      ),
    );
  }
}
