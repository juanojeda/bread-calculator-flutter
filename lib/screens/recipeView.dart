import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/RecipeLibrary.dart';
import '../widgets/ingredientsTableDisplay.dart';
import 'recipeList.dart';

class RecipeViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _currentRecipe = context.watch<RecipeLibrary>().currentRecipe;

    if (_currentRecipe == null) {
      Navigator.pop(
          context, MaterialPageRoute(builder: (context) => RecipeListPage()));
    }

    return Scaffold(
        appBar: AppBar(
          // comes from the MaterialApp build method, which initialises the home page with a title property
          title: Text("Your recipes"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
              child: ListView(children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(_currentRecipe.name,
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 22)),
            ),
            ingredientsTableDisplay(_currentRecipe.ingredients)
          ])),
        ));
  }
}
