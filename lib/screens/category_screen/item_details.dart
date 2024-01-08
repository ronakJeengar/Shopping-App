import 'package:ecom/common_widgets/button.dart';
import 'package:ecom/consts/consts.dart';

class ItemDetails extends StatelessWidget {
  final String? title;

  const ItemDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
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
            color: redColor,
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  elevatedBtnScreen(
                      buttonName: 'Add to Cart',
                      textColor: Colors.white,
                      buttonColor: redColor,
                      screen: null
                  ),
                  elevatedBtnScreen(
                      buttonName: 'Add to Cart',
                      textColor: Colors.white,
                      buttonColor: redColor,
                      screen: null
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
