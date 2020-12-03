import 'package:bakers_percentages/screens/recipeCreator.dart';

import 'models/RecipeStore.dart';
import 'screens/recipeList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => RecipeStore(), child: BreadCalculator()));
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
        routes: {
          '/': (context) => RecipeCreator(),
          '/recipes': (context) => RecipeListPage()
        },
        initialRoute: '/recipes');
  }
}
