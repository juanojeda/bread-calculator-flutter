import 'package:flutter/material.dart';
import '../models/ingredient.model.dart';

String calcPercentage({int flourWeight, int ingredientWeight}) {
  double _percentage = (ingredientWeight / flourWeight * 100);
  return "${_percentage.toStringAsFixed(1)}";
}

String getFlourPercentage({int primaryFlourWeight, Ingredient ingredient}) {
  String _percentage = calcPercentage(
      flourWeight: primaryFlourWeight, ingredientWeight: ingredient.weight);

  return ingredient.isFlour ? "($_percentage)" : "";
}

Container _buildCell(
    {String text, TextStyle style, Alignment alignment = Alignment.topLeft}) {
  EdgeInsets _padding = EdgeInsets.only(bottom: 8);
  return Container(
      alignment: alignment,
      padding: _padding,
      child: TableCell(
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

Widget IngredientsTableDisplay(List<Ingredient> ingredients) {
  int _totalFlourWeight = ingredients
      .where((ing) => ing.isFlour)
      .map((ing) => ing.weight)
      .reduce((init, currWeight) => init + currWeight);

  int _primaryFlourWeight =
      ingredients.firstWhere((ing) => ing.isPrimaryFlour).weight;

  List<TableRow> _ingredientRows = ingredients
      .map((e) => _buildIngredientRowDisplay(
          ingredient: e,
          totalFlourWeight: _totalFlourWeight,
          primaryFlourWeight: _primaryFlourWeight))
      .toList();

  return Table(children: [_buildTableHeader(), ...?_ingredientRows]);
}
