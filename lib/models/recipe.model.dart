import 'dart:convert';

import 'ingredient.model.dart';

class Recipe {
  final String id;
  final String name;
  final List<Ingredient> ingredients;

  Recipe({this.id, this.name, this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    List<dynamic> _parsedIngredients = jsonDecode(json['ingredients']);

    return Recipe(
        id: json['id'],
        name: json['name'],
        ingredients: _parsedIngredients
            .map((ingredients) => Ingredient.fromJson((ingredients)))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "ingredients": jsonEncode(ingredients)
    };
  }
}
