import 'package:ecom/consts/consts.dart';

Widget circularAvatar(
    {required Color? bgColor,
    required double? radius,
    required String? image,
    required double? width}) {
  return CircleAvatar(
    backgroundColor: bgColor,
    radius: radius,
    child: Image.asset(image!, width: width),
  );
}
