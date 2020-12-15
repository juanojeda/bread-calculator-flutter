import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/recipe.model.dart';
import '../providers/RecipeLibrary.dart';
import 'recipeCreator.dart';
import 'recipeView.dart';

Function(DismissDirection) confirmDelete(BuildContext context) =>
    (DismissDirection direction) async {
      return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm"),
              content:
                  const Text("Are you sure you want to delete this recipe?"),
              actions: <Widget>[
                FlatButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("YES, DELETE")),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("NO, CANCEL"),
                ),
              ],
            );
          });
    };

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
                  child: Dismissible(
                      key: Key(recipe.id),
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
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (DismissDirection direction) {
                        recipeLibrary.delete(recipe);
                      },
                      confirmDismiss: confirmDelete(context),
                      background: Container(
                          color: Colors.red[900],
                          child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  )))))))
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
