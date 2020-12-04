import 'package:bakers_percentages/models/RecipeDraft.dart';
import 'package:bakers_percentages/screens/recipeCreator.dart';

import 'models/RecipeLibrary.dart';
import 'screens/recipeList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((MultiProvider(providers: [
    ChangeNotifierProvider<RecipeLibrary>(create: (_) => RecipeLibrary()),
    ChangeNotifierProvider<RecipeDraft>(create: (_) => RecipeDraft())
  ], child: BreadCalculator())));
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
          '/': (context) => RecipeListPage(),
          '/add': (context) => RecipeCreator()
        },
        initialRoute: '/');
  }
}
