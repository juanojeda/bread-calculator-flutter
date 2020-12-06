class Ingredient {
  final String name;
  final int weight;
  final bool isFlour;
  final bool isPrimaryFlour;

  Ingredient({this.name, this.weight, this.isFlour, this.isPrimaryFlour});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      weight: json['weight'],
      isFlour: json['isFlour'],
      isPrimaryFlour: json['isPrimaryFlour'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "weight": this.weight,
      "isFlour": this.isFlour,
      "isPrimaryFlour": this.isPrimaryFlour,
    };
  }
}
