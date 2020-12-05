import 'package:bakers_percentages/models/RecipeDraft.dart';
import 'package:bakers_percentages/models/ingredient.model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class AddIngredientForm extends StatefulWidget {
  @override
  AddIngredientFormState createState() => AddIngredientFormState();
}

class AddIngredientFormState extends State<AddIngredientForm> {
  final _formKey = GlobalKey<FormState>();

  String _ingredientName = "";
  int _weight = 0;
  var _isFlour = false;
  var _isPrimaryFlour = false;

  @override
  Widget build(BuildContext context) {
    RecipeDraft _draftStore = context.watch<RecipeDraft>();
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: "Ingredient name*"),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Enter an ingredient.";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _ingredientName = value;
              });
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: "Weight (g)*"),
            keyboardType: TextInputType.phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (value.isEmpty) {
                return "Enter a weight in grams.";
              }
              if (!RegExp(r'^[\d]+$').hasMatch(value)) {
                return "Enter a weight in digits.";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _weight = int.parse(value);
              });
            },
          ),
          CheckboxListTile(
            title: Text("Is it a flour?"),
            value: _isFlour,
            selected: _isFlour,
            onChanged: (bool newValue) {
              setState(() {
                _isFlour = newValue;

                if (newValue == false) {
                  _isPrimaryFlour = false;
                }
              });
            },
          ),
          Visibility(
              child: CheckboxListTile(
                title: Text("Is it the main flour?"),
                selected: _isPrimaryFlour,
                value: _isPrimaryFlour,
                onChanged: (bool newValue) {
                  setState(() {
                    _isPrimaryFlour = newValue;
                  });
                },
              ),
              visible: _isFlour),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Adding ingredient'),
                    backgroundColor: Colors.teal,
                    duration: Duration(milliseconds: 1000),
                  ));

                  Ingredient _ingredient = Ingredient(
                      name: _ingredientName,
                      weight: _weight,
                      isFlour: _isFlour,
                      isPrimaryFlour: _isPrimaryFlour);

                  _draftStore.addIngredient(_ingredient);

                  _formKey.currentState.reset();
                  _ingredientName = "";
                  _weight = 0;
                  _isFlour = false;
                  _isPrimaryFlour = false;
                }
              },
              child: Text("Add ingredient"))
        ],
      ),
    );
  }
}
