import 'package:ecom/consts/consts.dart';

Widget appLogo() {
  return Image.asset(icAppLogo)
      .box
      .white
      .size(100, 100)
      .padding(const EdgeInsets.all(8))
      .roundedLg
      .make();
}
