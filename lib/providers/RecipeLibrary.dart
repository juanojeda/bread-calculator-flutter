import 'package:flutter/material.dart';
import 'dart:collection';

import '../models/recipe.model.dart';
import 'DBHelper.dart';

class RecipeLibrary extends ChangeNotifier {
  final DBHelper dbHelper;
  List<Recipe> _recipes = [];
  Recipe _currentRecipe;

  RecipeLibrary(this._recipes, this.dbHelper) {
    if (dbHelper != null) {
      fetchAndSetData();
    }
  }

  Future<void> fetchAndSetData() async {
    if (dbHelper.db != null) {
      final dataList = await dbHelper.getData();

      _recipes = dataList.map((item) => Recipe.fromJson(item)).toList();
      notifyListeners();
    }
  }

  UnmodifiableListView<Recipe> get recipes => UnmodifiableListView(_recipes);

  Recipe get currentRecipe => _currentRecipe;

  void add(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();

    dbHelper.insert(recipe.toJson());
  }

  void delete(Recipe recipe) {
    _recipes.remove(recipe);
    notifyListeners();

    dbHelper.delete(recipe);
  }

  void openRecipe(recipeId) {
    _currentRecipe = _recipes.firstWhere((recipe) => recipe.id == recipeId,
        orElse: () => null);

    notifyListeners();
  }

  void closeRecipe() {
    _currentRecipe = null;

    notifyListeners();
  }

  // figure out how to edit an item
  // void edit()
}
