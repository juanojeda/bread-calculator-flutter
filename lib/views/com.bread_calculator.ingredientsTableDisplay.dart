import 'package:flutter/material.dart';
import 'package:bread_calculator/models/com.bread_calculator.ingredient.model.dart';

String calcPercentage({int flourWeight, int ingredientWeight}) {
  double _percentage = (ingredientWeight / flourWeight * 100);
  return "${_percentage.toStringAsFixed(1)}";
}

String getFlourPercentage({int primaryFlourWeight, Ingredient ingredient}) {
  String _percentage = calcPercentage(
      flourWeight: primaryFlourWeight, ingredientWeight: ingredient.weight);

  return ingredient.isFlour ? "($_percentage)" : "";
}

TableRow _buildIngredientRowDisplay(
    {Ingredient ingredient, int totalFlourWeight, primaryFlourWeight}) {
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
                calcPercentage(
                        flourWeight: totalFlourWeight,
                        ingredientWeight: ingredient.weight)
                    .toString(),
                style: _style))),
    Container(
        padding: _padding,
        alignment: Alignment.topRight,
        child: TableCell(
          child: Text(
            getFlourPercentage(
                primaryFlourWeight: primaryFlourWeight, ingredient: ingredient),
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
              ingredient: e,
              totalFlourWeight: _totalFlourWeight,
              primaryFlourWeight: _primaryFlourWeight))
          .toList());
}
