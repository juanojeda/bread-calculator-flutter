import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/recipe.model.dart';

class RecipeDraft extends ChangeNotifier {
  Recipe _draft = Recipe(id: Uuid().v4(), name: "", ingredients: []);

  get draft => _draft;

  void updateName(String name) {
    Recipe _newDraft = Recipe(name: name, ingredients: _draft.ingredients);
    _draft = _newDraft;

    notifyListeners();
  }

  void addIngredient(ingredient) {
    _draft.ingredients.add(ingredient);
    notifyListeners();
  }

  void removeIngredient(ingredient) {
    _draft.ingredients.remove(ingredient);
    notifyListeners();
  }

  void clear() {
    _draft = Recipe(id: Uuid().v4(), name: "", ingredients: []);
    notifyListeners();
  }
}
