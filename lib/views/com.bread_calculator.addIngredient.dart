import 'package:flutter/material.dart';

class AddIngredientForm extends StatefulWidget {
  @override
  AddIngredientFormState createState() {
    return AddIngredientFormState();
  }
}

class AddIngredientFormState extends State<AddIngredientForm> {
  final _formKey = GlobalKey<FormState>();
  String _ingredientName = "";
  int _weight = 0;
  var _isFlour = false;
  var _isPrimaryFlour = false;

  @override
  Widget build(BuildContext context) {
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
              }),
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
          ),
          CheckboxListTile(
            title: Text("Is it a flour?"),
            value: _isFlour,
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
                value: _isPrimaryFlour,
                onChanged: (bool newValue) {
                  setState(() {
                    _isPrimaryFlour = newValue;
                  });
                },
              ),
              visible: _isFlour)
        ],
      ),
    );
  }
}
