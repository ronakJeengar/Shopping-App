import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/cart_controller.dart';
import 'package:ecom/services/firestore_services.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: "No items found in cart".text.color(darkFontGrey).make(),
            );
          } else {
            var data = snapshot.data!.docs;
            cartController.calculateTotalPrice(data);
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network("${data[index]['image']}"),
                              title: "${data[index]['title']} (x${data[index]['qty']})"
                                  .text
                                  .fontFamily(semibold)
                                  .size(16)
                                  .make(),
                              subtitle: "\$ ${data[index]['totalPrice']}"
                                  .text
                                  .size(16)
                                  .color(redColor)
                                  .fontFamily(semibold)
                                  .make(),
                              trailing: IconButton(
                                onPressed: () {
                                  FirestoreServices.deleteProduct(data[index].id);
                                },
                                icon: const Icon(Icons.delete, color: redColor),
                              ),
                            );
                          })),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Total Price"
                            .text
                            .color(darkFontGrey)
                            .fontFamily(semibold)
                            .make(),
                        cartController.totalPrice.value.text
                            .color(redColor)
                            .fontFamily(semibold)
                            .make()
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12.0))
                        .width(context.screenWidth - 60)
                        .color(lightGrey)
                        .roundedSM
                        .make(),
                  ),
                  10.heightBox,
                  SizedBox(
                    width: (context.screenWidth - 60),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: redColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      child: const Text("Shipping"),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
