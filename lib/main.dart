import 'package:bread_calculator/views/com.bread_calculator.IngredientsTableDisplay.dart';
import 'package:bread_calculator/views/com.bread_calculator.addIngredient.dart';
import 'package:flutter/material.dart';
import 'package:bread_calculator/data/com.bread_calculator.mock_ingredients.dart'
    as mock;

import 'models/com.bread_calculator.ingredient.model.dart';

void main() {
  runApp(BreadCalculator());
}

getIngredients() {
  return mock.ingredients;
}

class BreadCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bread Calculator',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BreadCalculatorHomePage());
  }
}

class BreadCalculatorHomePage extends StatefulWidget {
  @override
  _BreadCalculatorHomePageState createState() =>
      _BreadCalculatorHomePageState();
}

class _BreadCalculatorHomePageState extends State<BreadCalculatorHomePage> {
  final String title = 'Bread Calculator';
  final List<Ingredient> ingredients = [];

  @override
  Widget build(BuildContext context) {
    // like the render method, reruns each time setState is called
    return Scaffold(
      appBar: AppBar(
        // comes from the MaterialApp build method, which initialises the home page with a title property
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [AddIngredientForm()],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            List _ingredients = getIngredients();
            setState(() {
              ingredients.addAll([..._ingredients]);
            });
          },
          child: Icon(Icons.add)),
    );
  }
}
