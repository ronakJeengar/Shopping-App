import 'package:ecom/common_widgets/button.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/product_controller.dart';
import 'package:ecom/screens/home_screen/component/featured_products.dart';
import 'package:get/get.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ItemDetails({super.key, this.title, this.data});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.find<ProductController>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: title!.text.color(darkFontGrey).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share, color: darkFontGrey)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_outline, color: darkFontGrey)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350,
                      viewportFraction: 1.0,
                      itemCount: data['product_image'].length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          data['product_image'][index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .color(darkFontGrey)
                      .fontFamily(bold)
                      .size(16)
                      .make(),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    value: double.parse(data['product_rating']),
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    maxRating: 5,
                    size: 25,
                  ),
                  10.heightBox,
                  '\$${data['product_price']}'
                      .text
                      .color(redColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller".text.white.fontFamily(semibold).make(),
                          5.heightBox,
                          '${data['product_seller']}'
                              .text
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .size(16)
                              .make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      )
                    ],
                  )
                      .box
                      .height(60)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
                  20.heightBox,
                  Column(
                    children: [
                      //color section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color".text.color(textfieldGrey).make(),
                          ),
                          Obx(
                            () => Row(
                              children: List.generate(
                                data['product_colors'].length,
                                (index) => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    VxBox()
                                        .size(40, 40)
                                        .roundedFull
                                        .color(
                                            Color(data['product_colors'][index])
                                                .withOpacity(1.0))
                                        .margin(const EdgeInsets.symmetric(
                                            horizontal: 6))
                                        .make()
                                        .onTap(() {
                                      productController
                                          .showSelectedColor(index);
                                    }),
                                    Visibility(
                                      visible: index ==
                                          productController
                                              .selectedColorIndex.value,
                                      child: const Icon(Icons.done,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      //Quantity Section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child:
                                "Quantity: ".text.color(textfieldGrey).make(),
                          ),
                          Obx(
                            () => Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      productController.decreaseQuantity();
                                      productController.calculateTotalPrice(
                                          int.parse(data['product_price']));
                                    },
                                    icon: const Icon(Icons.remove)),
                                productController.quantity.value.text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                    onPressed: () {
                                      productController.increaseQuantity(
                                          int.parse(data['product_quantity']));
                                      productController.calculateTotalPrice(
                                          int.parse(data['product_price']));
                                    },
                                    icon: const Icon(Icons.add)),
                                10.widthBox,
                                "(${data['product_quantity']} Left)"
                                    .text
                                    .color(textfieldGrey)
                                    .make()
                              ],
                            ),
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      //Total Section
                      Obx(
                        () => Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total".text.color(textfieldGrey).make(),
                            ),
                            "${productController.totalPrice.value}"
                                .numCurrency
                                .text
                                .size(16)
                                .color(redColor)
                                .fontFamily(bold)
                                .make()
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      )
                    ],
                  ).box.white.shadowSm.make(),
                  10.heightBox,
                  //Description Section
                  "Description"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  "${data['product_desc']}"
                      .text
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  //Buttons Section
                  ListView(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.vertical,
                    children: List.generate(
                        5,
                        (index) => ListTile(
                              title: "Video"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                              trailing: const Icon(Icons.arrow_forward),
                            )),
                  ),
                  20.heightBox,
                  "Products You may Also like"
                      .text
                      .fontFamily(bold)
                      .size(16)
                      .color(darkFontGrey)
                      .make(),
                  20.heightBox,
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        6,
                        (index) => featuredProductAsset(
                          image: imgP1,
                          height: 150,
                          width: 150,
                          title: 'Laptop 4 GB/512 GB SSD',
                          price: '\$400.00',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: elevatedBtnScreen(
                buttonName: 'Add to Cart',
                textColor: Colors.white,
                buttonColor: redColor,
                screen: null),
          )
        ],
      ),
    );
  }
}
