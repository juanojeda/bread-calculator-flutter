import 'package:bakers_percentages/models/com.bakers_percentages.ingredient.model.dart';

class Recipe {
  Recipe({this.name, this.ingredients}) : super();

  final String name;
  final List<Ingredient> ingredients;
}
