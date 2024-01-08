import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/screens/category_screen/categories_details.dart';
import 'package:ecom/screens/category_screen/component/all_categories.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  List<dynamic> categoriesImgs = [
imgFc1,
    imgFc2,
    imgFc3,
    imgFc4,
    imgFc5,
    imgFc6,
    imgFc7,
    imgFc8,
    imgFc9
  ];

  List<dynamic> categoriesTitles = [
'Woman Clothing',
    'Man Clothing',
    'Computer Accessories',
    'Automobile',
    'Kids & Toys',
    'Fashion',
    'Cosmetics',
    'Fitness',
    'Study Material',
  ];

  static List<dynamic> subCategoryWomanClothing =  [
    'Woman Clothing',
    'Woman Clothing',
    'Woman Clothing',
    'Woman Clothing',
  ];

  static List<dynamic> subCategoryManClothing = [
    'Man Clothing',
    'Man Clothing',
    'Man Clothing',
    'Man Clothing',
  ];

  static List<dynamic> subCategoryComputerAccessories = [
    'Computer Accessories',
    'Computer Accessories',
    'Computer Accessories',
    'Computer Accessories',
  ];

  static List<dynamic> subCategoryAutomobile = [
    'Automobile',
    'Automobile',
    'Automobile',
    'Automobile',
  ];

  static List<dynamic> subCategoryKidsToys = [
    'KidsToys',
    'KidsToys',
    'KidsToys',
    'KidsToys',
  ];

  static List<dynamic> subCategoryFashion = [
    'Fashion',
    'Fashion',
    'Fashion',
    'Fashion',
  ];

  static List<dynamic> subCategoryCosmetics = [
    'Cosmetics',
    'Cosmetics',
    'Cosmetics',
    'Cosmetics',
  ];

  static List<dynamic> subCategoryFitness = [
    'Fitness',
    'Fitness',
    'Fitness',
    'Fitness',
  ];

  static List<dynamic> subCategoryStudyMaterial = [
    'Study Material',
    'Study Material',
    'Study Material',
    'Study Material',
  ];

  static List<List<dynamic>> subCategories = [
    subCategoryWomanClothing,
    subCategoryManClothing,
    subCategoryComputerAccessories,
    subCategoryAutomobile,
    subCategoryKidsToys,
    subCategoryFashion,
    subCategoryCosmetics,
    subCategoryFitness,
    subCategoryStudyMaterial
  ];


  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        appBar: AppBar(
          title: 'Categories'.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoriesTitles.length,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: context.screenHeight * 0.20),
              itemBuilder: (context, index) {
                return getCategories(
                    image: categoriesImgs[index],
                    title: categoriesTitles[index],
                  subCategories: subCategories
                ).onTap(() {
                  Get.to(() => CategoriesDetails(title: categoriesTitles[index], subCategory: subCategories,));
                });
              })
        ),
      )
    );
  }
}
