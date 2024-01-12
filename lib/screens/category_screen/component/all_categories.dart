import 'package:ecom/consts/consts.dart';

Widget getCategories({required String? image, required String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset(
        image!,
        height: 150,
        width: 200,
        fit: BoxFit.fitHeight,
      ),
      10.widthBox,
      Align(
        alignment: Alignment.center,
        child: Text(
          title!,
        ).text.color(darkFontGrey).align(TextAlign.center).fontFamily(semibold).make(),
      )
    ],
  )
      .box
      .rounded
      .clip(Clip.antiAlias)
      .white
      .margin(const EdgeInsets.symmetric(horizontal: 4.0))
      .padding(const EdgeInsets.all(8.0))
      .roundedSM
      .outerShadowSm
      .make();
}
