import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/DBHelper.dart';
import 'providers/RecipeDraft.dart';
import 'providers/RecipeLibrary.dart';

import 'screens/recipeCreator.dart';
import 'screens/recipeList.dart';

void main() {
  runApp((MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => DBHelper()),
    ChangeNotifierProxyProvider<DBHelper, RecipeLibrary>(
      create: (context) => RecipeLibrary([], null),
      update: (context, db, previous) => RecipeLibrary(previous.recipes, db),
    ),
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
