import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/recipe.model.dart';

class RecipeDraft extends ChangeNotifier {
  Recipe _draft = Recipe(id: Uuid().v4(), name: "", ingredients: []);
  String _id;

  get draft => _draft;

  void updateName(String name) {
    Recipe _newDraft = Recipe(id: _draft.id, name: name, ingredients: _draft.ingredients);
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
    _id = Uuid().v4();
    _draft = Recipe(id: _id, name: "", ingredients: []);
    notifyListeners();
  }
}
