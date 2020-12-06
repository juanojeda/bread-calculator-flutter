import 'package:bakers_percentages/models/RecipeDraft.dart';
import 'package:bakers_percentages/screens/recipeCreator.dart';
import 'package:bakers_percentages/data/mock_ingredients.dart' as mock;
import 'package:uuid/uuid.dart';

import 'models/RecipeLibrary.dart';
import 'models/recipe.model.dart';
import 'screens/recipeList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((MultiProvider(providers: [
    ChangeNotifierProvider<RecipeLibrary>(create: (_) => RecipeLibrary()),
    ChangeNotifierProvider<RecipeDraft>(create: (_) => RecipeDraft())
  ], child: BreadCalculator())));
}

class BreadCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeLibrary recipeLibrary = context.watch<RecipeLibrary>();

    //prefill list with mock recipes
    if (recipeLibrary.recipes.length < 3) {
      recipeLibrary.add(Recipe(
          id: Uuid().v4(),
          name: "Test Recipe 1",
          ingredients: mock.ingredients));
      recipeLibrary.add(Recipe(
          id: Uuid().v4(),
          name: "Test Recipe 2",
          ingredients: mock.ingredients));
      recipeLibrary.add(Recipe(
          id: Uuid().v4(),
          name: "Test Recipe 3",
          ingredients: mock.ingredients));
    }

    return MaterialApp(
        title: 'Bread Calculator',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/': (context) => RecipeListPage(),
          '/add': (context) => RecipeCreator()
        },
        initialRoute: '/');
  }
}
