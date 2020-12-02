import 'package:bread_calculator/models/com.bread_calculator.ingredient.model.dart';

List<Ingredient> ingredients = [
  Ingredient(
      name: "Plain flour", weight: 500, isFlour: true, isPrimaryFlour: true),
  Ingredient(
      name: "Baker's flour", weight: 273, isFlour: true, isPrimaryFlour: false),
  Ingredient(
      name: "Rye flour", weight: 130, isFlour: true, isPrimaryFlour: false),
  Ingredient(
      name: "Spelt flour", weight: 90, isFlour: true, isPrimaryFlour: false),
  Ingredient(name: "Water", weight: 750, isFlour: false, isPrimaryFlour: false),
  Ingredient(
      name: "Levain", weight: 235, isFlour: false, isPrimaryFlour: false),
  Ingredient(name: "Salt", weight: 18, isFlour: false, isPrimaryFlour: false),
];
