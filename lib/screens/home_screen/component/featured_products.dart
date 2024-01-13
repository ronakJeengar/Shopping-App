import 'package:ecom/consts/consts.dart';

Widget featuredProductNetwork({
  required String? image,
  required double? height,
  required double? width,
  required String? title,
  required String? price}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.network(
        image!,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      Text(
        title!,
      ).text.color(darkFontGrey).fontFamily(semibold).make(),
      10.widthBox,
      Text(
        price!,
      ).text.color(redColor).size(16).fontFamily(bold).make(),
    ],
  )
      .box
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 4.0))
      .padding(const EdgeInsets.all(8.0))
      .roundedSM
      .outerShadowSm
      .make();
}

Widget featuredProductAsset({
  required String? image,
  required double? height,
  required double? width,
  required String? title,
  required String? price}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        image!,
        height: height,
        width: width,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      Text(
        title!,
      ).text.color(darkFontGrey).fontFamily(semibold).make(),
      10.widthBox,
      Text(
        price!,
      ).text.color(redColor).size(16).fontFamily(bold).make(),
    ],
  )
      .box
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 4.0))
      .padding(const EdgeInsets.all(8.0))
      .roundedSM
      .outerShadowSm
      .make();
}
