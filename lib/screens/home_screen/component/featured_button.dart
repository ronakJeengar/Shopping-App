import 'package:ecom/consts/consts.dart';

Widget featuredButton({required String? image, required String? title}) {
  return Row(
    children: [
      Image.asset(
        image!,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      Text(
        title!,
      ).text.color(darkFontGrey).fontFamily(semibold).make()
    ],
  )
      .box
      .width(200)
  .height(75)
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 4.0))
      .padding(const EdgeInsets.all(4.0))
      .roundedSM
      .outerShadowSm
      .make();
}
