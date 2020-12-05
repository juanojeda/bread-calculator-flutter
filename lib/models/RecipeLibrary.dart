import 'dart:collection';

import 'package:flutter/material.dart';

import 'recipe.model.dart';

class RecipeLibrary extends ChangeNotifier {
  final List<Recipe> _recipes = [];
  Recipe _currentRecipe;

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);
  Recipe get currentRecipe => _currentRecipe;

  void add(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void openRecipe(recipeId) {
    _currentRecipe = _recipes.firstWhere((recipe) => recipe.id == recipeId,
        orElse: () => null);

    print("Current REcipe ${_currentRecipe.id}, ${_currentRecipe.name}");

    notifyListeners();
  }

  void closeRecipe() {
    _currentRecipe = null;

    notifyListeners();
  }

  // figure out how to edit an item
  // void edit()
}
