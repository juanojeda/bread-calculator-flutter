import 'package:flutter/material.dart';
import 'package:bread_calculator/models/com.bread_calculator.ingredient.model.dart';

String calcPercentage(int totalFlourWeight, int ingredientWeight) {
  double _percentage = (ingredientWeight / totalFlourWeight * 100);
  return "${_percentage.toStringAsFixed(1)}";
}

String getFlourPercentage(int primaryFlourWeight, Ingredient ingredient) {
  String _percentage = calcPercentage(primaryFlourWeight, ingredient.weight);

  return ingredient.isFlour ? "($_percentage)" : "";
}

TableRow _buildIngredientRowDisplay(
    Ingredient ingredient, int totalFlourWeight, primaryFlourWeight) {
  TextStyle _style = TextStyle(
      color: ingredient.isFlour ? Colors.brown.shade400 : Colors.grey.shade700,
      fontSize: 16,
      fontWeight:
          ingredient.isPrimaryFlour ? FontWeight.w800 : FontWeight.w400);

  EdgeInsets _padding = EdgeInsets.only(bottom: 8);

  return TableRow(children: [
    Container(
        padding: _padding,
        child: TableCell(
            child: Text(
          ingredient.name,
          style: _style,
          softWrap: true,
        ))),
    Container(
        padding: _padding,
        alignment: Alignment.topRight,
        child: TableCell(
            child: Text("${ingredient.weight.toString()}g", style: _style))),
    Container(
        padding: _padding,
        alignment: Alignment.topRight,
        child: TableCell(
            child: Text(
                calcPercentage(totalFlourWeight, ingredient.weight).toString(),
                style: _style))),
    Container(
        padding: _padding,
        alignment: Alignment.topRight,
        child: TableCell(
          child: Text(
            getFlourPercentage(primaryFlourWeight, ingredient),
            style: _style,
          ),
        ))
  ]);
}

Widget ingredientsTableDisplay(List<Ingredient> ingredients) {
  int _totalFlourWeight = ingredients
      .where((ing) => ing.isFlour)
      .map((ing) => ing.weight)
      .reduce((init, currWeight) => init + currWeight);

  int _primaryFlourWeight =
      ingredients.firstWhere((ing) => ing.isPrimaryFlour).weight;

  return Table(
      children: ingredients
          .map((e) => _buildIngredientRowDisplay(
              e, _totalFlourWeight, _primaryFlourWeight))
          .toList());
}
