import 'ingredient.model.dart';

class Recipe {
  Recipe({this.id, this.name, this.ingredients}) : super();

  final String id;
  final String name;
  final List<Ingredient> ingredients;
}
