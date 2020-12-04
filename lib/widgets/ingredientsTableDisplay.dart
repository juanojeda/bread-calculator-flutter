import 'package:flutter/material.dart';
import '../models/ingredient.model.dart';

String calcPercentage({int flourWeight, int ingredientWeight}) {
  if (flourWeight == 0) {
    return "-";
  }
  double _percentage = (ingredientWeight / flourWeight * 100);
  return "${_percentage.toStringAsFixed(1)}";
}

String getFlourPercentage({int primaryFlourWeight, Ingredient ingredient}) {
  String _percentage = calcPercentage(
      flourWeight: primaryFlourWeight, ingredientWeight: ingredient.weight);

  return ingredient.isFlour ? "($_percentage)" : "";
}

TableCell _buildCell(
    {String text, TextStyle style, Alignment alignment = Alignment.topLeft}) {
  EdgeInsets _padding = EdgeInsets.only(bottom: 8);
  return TableCell(
      child: Container(
          alignment: alignment,
          padding: _padding,
          child: Text(
            text,
            style: style,
            softWrap: true,
          )));
}

TableRow _buildIngredientRowDisplay(
    {Ingredient ingredient, int totalFlourWeight, primaryFlourWeight}) {
  TextStyle _style = TextStyle(
      color: ingredient.isFlour ? Colors.brown.shade400 : Colors.grey.shade700,
      fontSize: 16,
      fontWeight:
          ingredient.isPrimaryFlour ? FontWeight.w800 : FontWeight.w400);

  return TableRow(children: [
    _buildCell(text: ingredient.name, style: _style),
    _buildCell(
        text: "${ingredient.weight.toString()}g",
        style: _style,
        alignment: Alignment.topRight),
    _buildCell(
        text: calcPercentage(
                flourWeight: totalFlourWeight,
                ingredientWeight: ingredient.weight)
            .toString(),
        alignment: Alignment.topRight,
        style: _style),
    _buildCell(
        text: getFlourPercentage(
            primaryFlourWeight: primaryFlourWeight, ingredient: ingredient),
        alignment: Alignment.topRight,
        style: _style)
  ]);
}

TableRow _buildTableHeader() {
  TextStyle _style = TextStyle(
      color: Colors.grey.shade800, fontWeight: FontWeight.w800, fontSize: 16);

  return TableRow(children: [
    _buildCell(text: "Ingredient", style: _style),
    _buildCell(text: "Weight", style: _style, alignment: Alignment.topRight),
    _buildCell(text: "%", style: _style, alignment: Alignment.topRight),
    _buildCell(text: "% (flour)", style: _style, alignment: Alignment.topRight),
  ]);
}

void sortIngredients(List<Ingredient> ingredients) {
  ingredients.sort((a, b) {
    if (b.isPrimaryFlour) {
      return 1;
    }
    if (a.isPrimaryFlour) {
      return -1;
    }
    if (b.isFlour && !a.isFlour) {
      if (a.isPrimaryFlour) {
        return -1;
      }
      return 1;
    }

    if (b.weight > a.weight) {
      return 1;
    }

    return -1;
  });
}

Widget ingredientsTableDisplay(List<Ingredient> ingredients) {
  print("Table display: ${ingredients[0].name} ${ingredients[0].weight}");

  List<Ingredient> _allFlours =
      ingredients.where((ing) => ing.isFlour).toList();

  int _totalFlourWeight = _allFlours.length > 0
      ? _allFlours.map((ing) {
          print("map $ing");
          return ing.weight;
        }).reduce((init, currWeight) => init + currWeight)
      : 0;

  int _primaryFlourWeight = ingredients
      .firstWhere(
        (ing) => ing.isPrimaryFlour,
        orElse: () => Ingredient(
          weight: 0,
        ),
      )
      .weight;

  sortIngredients(ingredients);

  List<TableRow> _ingredientRows = ingredients
      .map((e) => _buildIngredientRowDisplay(
          ingredient: e,
          totalFlourWeight: _totalFlourWeight,
          primaryFlourWeight: _primaryFlourWeight))
      .toList();

  return Table(children: [_buildTableHeader(), ...?_ingredientRows]);
}
