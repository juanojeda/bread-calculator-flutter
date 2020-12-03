import 'dart:collection';

import 'package:bakers_percentages/models/com.bakers_percentages.recipe.model.dart';
import 'package:flutter/material.dart';

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
