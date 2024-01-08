import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/screens/category_screen/component/sub_categories.dart';
import 'package:ecom/screens/category_screen/item_details.dart';
import 'package:ecom/screens/home_screen/component/featured_products.dart';
import 'package:get/get.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;
  final List<List<dynamic>> subCategory;

  const CategoriesDetails(
      {super.key, required this.title, required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return bg(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, // Change the color here
        ),
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    List.generate(4, (index) => subCategories(text: title)),
              ),
            ),
            10.heightBox,
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        mainAxisExtent: context.screenHeight * 0.30),
                    itemBuilder: (context, index) {
                      return featuredProduct(
                          image: imgP5,
                          height: 250,
                          width: 200,
                          title: 'Bag',
                          price: '\$400').onTap(() {
                        Get.to(() => const ItemDetails(title: 'Bag'));
                      });
                    }),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
