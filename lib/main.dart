import 'package:bakers_percentages/models/com.bakers_percentages.RecipeStore.dart';
import 'package:bakers_percentages/widgets/com.bakers_percentages.IngredientsTableDisplay.dart';
import 'package:bakers_percentages/widgets/com.bakers_percentages.addIngredient.dart';
import 'package:flutter/material.dart';
import 'package:bakers_percentages/data/com.bakers_percentages.mock_ingredients.dart'
    as mock;
import 'package:provider/provider.dart';

import 'models/com.bakers_percentages.recipe.model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => RecipeStore(), child: BreadCalculator()));
}

getIngredients() {
  return mock.ingredients;
}

class BreadCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bread Calculator',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {'/': (context) => BreadCalculatorHomePage()},
        initialRoute: '/');
  }
}

class BreadCalculatorHomePage extends StatelessWidget {
  final String title = 'Bread Calculator';

  @override
  Widget build(BuildContext context) {
    var recipes = context.watch<RecipeStore>().recipes;
    // like the render method, reruns each time setState is called
    return Scaffold(
      appBar: AppBar(
        // comes from the MaterialApp build method, which initialises the home page with a title property
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              AddIngredientForm(),
              recipes.length > 0
                  ? IngredientsTableDisplay(recipes[0].ingredients)
                  : Center(
                      child: Text("No ingredients to display"),
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            var recipeStore = context.read<RecipeStore>();
            List _ingredients = getIngredients();

            Recipe recipe = Recipe(name: "Bread", ingredients: _ingredients);

            recipeStore.add(recipe);
          },
          child: Icon(Icons.add)),
    );
  }
}
