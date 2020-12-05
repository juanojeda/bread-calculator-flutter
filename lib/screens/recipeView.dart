import 'package:bakers_percentages/models/recipe.model.dart';
import 'package:bakers_percentages/screens/recipeCreator.dart';
import 'package:bakers_percentages/screens/recipeList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/RecipeLibrary.dart';

class RecipeViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _currentRecipe = context.watch<RecipeLibrary>().currentRecipe;

    if (_currentRecipe == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Recipe doesn\'t exist!'),
        backgroundColor: Colors.red,
        duration: Duration(milliseconds: 1000),
      ));
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => RecipeListPage()));
    }

    return Scaffold(
      appBar: AppBar(
        // comes from the MaterialApp build method, which initialises the home page with a title property
        title: Text("Your recipes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: ListView(children: [
          Padding(
            padding: EdgeInsets.only(top: 24, bottom: 16),
            child: Text(_currentRecipe.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )
        ])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => RecipeCreator())),
        child: Icon(Icons.add_box_outlined),
      ),
    );
  }
}
