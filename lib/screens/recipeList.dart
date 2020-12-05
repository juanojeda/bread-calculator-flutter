import 'package:bakers_percentages/models/recipe.model.dart';
import 'package:bakers_percentages/screens/recipeCreator.dart';
import 'package:bakers_percentages/screens/recipeView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/RecipeLibrary.dart';

List<ListTile> _buildRecipes(
    List<Recipe> recipes, Function() Function() onTapRecipe) {
  return recipes.toList().map(
      (recipe) => ListTile(title: Text(recipe.name), onTap: onTapRecipe()));
}

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeLibrary recipeLibrary = context.watch<RecipeLibrary>();

    Function getOnTap() {
      return (Recipe recipe) {
        recipeLibrary.openRecipe(recipe.id);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeViewPage()));
      };
    }

    List<Recipe> recipes = recipeLibrary.recipes;
    return ListView(
      children: [..._buildRecipes(recipes, getOnTap())],
    );
  }
}

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // comes from the MaterialApp build method, which initialises the home page with a title property
        title: Text("Your recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(child: RecipeList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeCreator())),
        child: Icon(Icons.add_box_outlined),
      ),
    );
  }
}
