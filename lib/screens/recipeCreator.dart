import 'package:bakers_percentages/models/RecipeDraft.dart';
import 'package:bakers_percentages/models/RecipeLibrary.dart';
import 'package:bakers_percentages/models/recipe.model.dart';
import 'package:bakers_percentages/screens/recipeList.dart';

import '../models/RecipeDraft.dart';
import '../widgets/addIngredient.dart';
import '../widgets/ingredientsTableDisplay.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

Widget _buildRecipeTitle(name) {
  return Padding(
    padding: EdgeInsets.only(top: 24, bottom: 16),
    child:
        Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
  );
}

class RecipeCreator extends StatelessWidget {
  final String title = 'Add a recipe';

  @override
  Widget build(BuildContext context) {
    RecipeDraft _draftStore = context.watch<RecipeDraft>();
    Recipe _draft = _draftStore.draft;
    RecipeLibrary _recipeLibrary = Provider.of<RecipeLibrary>(context);

    // like the render method, reruns each time setState is called
    return Scaffold(
      appBar: AppBar(
        // comes from the MaterialApp build method, which initialises the home page with a title property
        title: Text(title),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _recipeLibrary.add(_draft);

                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => RecipeListPage()));
                _draftStore.clear();
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              TextFormField(
                  initialValue: _draft.name,
                  decoration: InputDecoration(labelText: "Recipe name*"),
                  onChanged: (value) => _draftStore.updateName(value)),
              AddIngredientForm(),
              _buildRecipeTitle(_draft.name),
              _draft.ingredients.length > 0
                  ? ingredientsTableDisplay(_draft.ingredients)
                  : Center(
                      child: Text("No ingredients to display"),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
