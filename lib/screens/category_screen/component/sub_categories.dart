import 'package:ecom/consts/consts.dart';

Widget subCategories({required String? text}) {
  return Text(
    text!,
    style: const TextStyle(fontFamily: semibold, fontSize: 18),
  ).box.roundedSM.alignCenter.white.size(150, 60).margin(const EdgeInsets.symmetric(horizontal: 4.0)).make();
}
