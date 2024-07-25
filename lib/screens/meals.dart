import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Nothing here...', style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),),
            SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      ); 
    if (meals.isNotEmpty) { 
      content = ListView.builder(
        itemCount : meals.length,  // this is necessary becoz we tell flutter how manu items we will have, if not then it shows error
      itemBuilder: (ctx, index) => Text(meals[index].title),
    );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
