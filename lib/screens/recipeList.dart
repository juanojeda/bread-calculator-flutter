import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.model.dart';
import '../providers/RecipeLibrary.dart';
import 'recipeCreator.dart';
import 'recipeView.dart';

class RecipeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeLibrary recipeLibrary = context.watch<RecipeLibrary>();
    List<Recipe> recipes = recipeLibrary.recipes;
    bool hasRecipes = recipes.length > 0;

    return ListView(
      children: hasRecipes
          ? [
              ...recipes.toList().map((recipe) => Card(
                      child: ListTile(
                    title: Text(recipe.name,
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    onTap: () {
                      recipeLibrary.openRecipe(recipe.id);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeViewPage()));
                    },
                  )))
            ]
          : [Center(child: Text("You don't have any recipes yet!"))],
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
        child: Icon(Icons.add),
      ),
    );
  }
}
