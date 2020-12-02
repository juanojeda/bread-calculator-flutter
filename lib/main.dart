import 'package:bread_calculator/views/com.bread_calculator.IngredientsTableDisplay.dart';
import 'package:flutter/material.dart';
import 'package:bread_calculator/data/com.bread_calculator.mock_ingredients.dart'
    as mock;

void main() {
  runApp(BreadCalculator());
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
        home: BreadCalculatorHomePage(
          title: 'Calculate Percentages',
          ingredients: mock.ingredients,
        ));
  }
}

class BreadCalculatorHomePage extends StatefulWidget {
  BreadCalculatorHomePage({Key key, this.title, this.ingredients})
      : super(key: key);

  final String title;
  final List ingredients;

  @override
  _BreadCalculatorHomePageState createState() =>
      _BreadCalculatorHomePageState();
}

class _BreadCalculatorHomePageState extends State<BreadCalculatorHomePage> {
  @override
  Widget build(BuildContext context) {
    // like the render method, reruns each time setState is called
    return Scaffold(
        appBar: AppBar(
          // comes from the MaterialApp build method, which initialises the home page with a title property
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[ingredientsTableDisplay(widget.ingredients)],
            ),
          ),
        ));
  }
}
