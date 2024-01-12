import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/product_controller.dart';
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
imgS1,
    imgFc1,
    imgFc2,
    imgFc3,
    imgFc4,
    imgFc5,
    imgFc6,
    imgFc7,
    imgFc9
  ];

  List<dynamic> categoriesTitles = [
    'Woman Dresses',
    'Man Clothing',
    'Computer Accessories',
    'Automobile',
    'Kids & Toys',
    'Sports',
    'Mobile Phones',
    'Cosmetics',
    'Furniture',
  ];

  final ProductController productController = Get.find<ProductController>();

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
                    title: categoriesTitles[index]
                ).onTap(() {
                  productController.getSubcategories(categoriesTitles[index]);
                  Get.to(() => CategoriesDetails(title: categoriesTitles[index]));
                });
              })
        ),
      )
    );
  }
}
