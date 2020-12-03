import 'ingredient.model.dart';

class Recipe {
  Recipe({this.name, this.ingredients}) : super();

  final String name;
  final List<Ingredient> ingredients;
}
