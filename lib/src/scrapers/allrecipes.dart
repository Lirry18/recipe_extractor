import 'package:html/dom.dart';

class Allrecipes {
  static Future<String?> recipeName(Document document) async {
    List<Node> titlesList = document.getElementsByTagName("h1");
    if (titlesList.isNotEmpty) {
      return titlesList[0].text;
    }
    return null;
  }

  static Future<List<String>?> ingredients(Document document) async {
    List<Element> ingredientsElList =
        document.querySelectorAll(".mntl-structured-ingredients__list-item p");
    List<String> ingredients = [];

    for (var ingredientEl in ingredientsElList) {
      ingredients.add(ingredientEl.text.replaceAll(RegExp(r"\s+"), " ").trim());
    }

    return ingredients;
  }

  static Future<List<String>?> instructions(Document document) async {
    List<Node> instructionsElList =
        document.querySelectorAll("#recipe__steps-content_1-0 p");
    List<String> instructions = [];

    for (var instructionEl in instructionsElList) {
      instructions.add(instructionEl.text!.trim());
    }

    return instructions;
  }
}