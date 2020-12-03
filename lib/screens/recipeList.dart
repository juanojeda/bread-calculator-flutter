import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/RecipeStore.dart';

Widget _buildRecipeList(recipes) {
  if (recipes.length > 0) {
    return recipes.map((recipe) => ListTile(title: Text(recipe.name)));
  }
  return Text("You haven't got any recipes yet!");
}

class RecipeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var recipes = context.watch<RecipeStore>().recipes;

    return Scaffold(
        appBar: AppBar(
          // comes from the MaterialApp build method, which initialises the home page with a title property
          title: Text("Your recipes"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(child: _buildRecipeList(recipes)),
        ));
  }
}
