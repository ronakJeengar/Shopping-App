import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/product_controller.dart';
import 'package:ecom/screens/category_screen/component/sub_categories.dart';
import 'package:ecom/screens/category_screen/item_details.dart';
import 'package:ecom/screens/home_screen/component/featured_products.dart';
import 'package:ecom/services/firestore_services.dart';
import 'package:get/get.dart';

class CategoriesDetails extends StatelessWidget {
  final String? title;

  const CategoriesDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.find<ProductController>();

    return bg(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white, // Change the color here
            ),
            title: title!
                .text
                .fontFamily(bold)
                .white
                .make(),
          ),
          body: StreamBuilder(
            stream: FirestoreServices.getProducts(title),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "No products found.".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              return Container(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(productController.subCat.length, (index) =>
                            Text(
                              productController.subCat[index],
                            ).box.roundedSM.alignCenter.white.size(150, 60).margin(
                                const EdgeInsets.symmetric(horizontal: 4.0)).make()),
                      ),
                    ),
                    10.heightBox,
                    Expanded(
                        child: SingleChildScrollView(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: context.screenHeight * 0.30),
                              itemBuilder: (context, index) {
                                return featuredProductNetwork(
                                    image: data[index]['product_image'][0],
                                    height: 250,
                                    width: 250,
                                    title: '${data[index]['product_name']}',
                                    price: '\$${data[index]['product_price']}').onTap(() {
                                  Get.to(() => ItemDetails(title: '${data[index]['product_name']}', data: data[index],));
                                });
                              }),
                        ))
                  ],
                ),
              );
            }
          },

          ),
        ));
  }
}
