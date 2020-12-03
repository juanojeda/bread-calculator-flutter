import '../models/recipe.model.dart';

import '../models/RecipeStore.dart';
import '../widgets/addIngredient.dart';
import '../widgets/ingredientsTableDisplay.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../data/mock_ingredients.dart' as mock;

_getIngredients() {
  return mock.ingredients;
}

class RecipeCreator extends StatelessWidget {
  final String title = 'Add a recipe';

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
            List _ingredients = _getIngredients();

            Recipe recipe = Recipe(name: "Bread", ingredients: _ingredients);

            recipeStore.add(recipe);
          },
          child: Icon(Icons.add)),
    );
  }
}
