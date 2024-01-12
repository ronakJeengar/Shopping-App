import 'package:ecom/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<dynamic> subCat = [];

  Future<void> getSubcategories(String title) async {

    subCat.clear();
    // Use rootBundle to load the JSON file
    String data =
        await rootBundle.loadString('lib/services/category_model.json');

    // Parse the JSON data using your model (replace with your actual model)
    CategoryModel decode = categoryModelFromJson(data);

    // Find the category with the given title
    List<Category> subcategories =
        decode.categories.where((element) => element.name == title).toList();

    // Extract subcategories and add them to the subCat list
    if (subcategories.isNotEmpty) {
      subCat.addAll(subcategories[0].subcategory);
    }
  }
}
