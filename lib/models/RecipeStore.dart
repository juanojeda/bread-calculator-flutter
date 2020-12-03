import 'dart:collection';

import 'package:flutter/material.dart';

import 'recipe.model.dart';

class RecipeStore extends ChangeNotifier {
  final List<Recipe> _recipes = [];

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  void add(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  // figure out how to edit an item
  // void edit()
}
