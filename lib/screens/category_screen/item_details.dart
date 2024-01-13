import 'package:ecom/common_widgets/button.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/screens/home_screen/component/featured_products.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
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
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  '\$35,000'
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
                          "In House Brands"
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
                          Row(
                            children: List.generate(
                                3,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 6))
                                    .make()),
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
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove)),
                              "0"
                                  .text
                                  .size(16)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add)),
                              10.widthBox,
                              "(0 Left)".text.color(textfieldGrey).make()
                            ],
                          )
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make(),
                      //Total Section
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Total".text.color(textfieldGrey).make(),
                          ),
                          "\$0.00"
                              .text
                              .size(16)
                              .color(redColor)
                              .fontFamily(bold)
                              .make()
                        ],
                      ).box.padding(const EdgeInsets.all(8)).make()
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
                  "This is the dummy description"
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
                              title: "Video".text.fontFamily(semibold).color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                        )),
                  ),
                  20.heightBox,
                  "Products You may Also like".text.fontFamily(bold).size(16).color(darkFontGrey).make(),
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
