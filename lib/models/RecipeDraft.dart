import 'package:flutter/material.dart';

import 'recipe.model.dart';

class RecipeDraft extends ChangeNotifier {
  Recipe _draft = Recipe(name: "", ingredients: []);

  get draft => _draft;

  void updateName(String name) {
    Recipe _newDraft = Recipe(name: name, ingredients: _draft.ingredients);
    _draft = _newDraft;

    notifyListeners();
  }

  void addIngredient(ingredient) {
    print("Draft store name: ${ingredient.name}");
    _draft.ingredients.add(ingredient);
    print("Draft store name: ${_draft.ingredients}");
    notifyListeners();
  }

  void removeIngredient(ingredient) {
    _draft.ingredients.remove(ingredient);
    notifyListeners();
  }

  void clear() {
    _draft = Recipe(name: "", ingredients: []);
    notifyListeners();
  }
}
