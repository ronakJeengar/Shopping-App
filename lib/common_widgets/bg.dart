import 'package:ecom/consts/consts.dart';

Widget bg({Widget? child}){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground),fit: BoxFit.fill
      )
    ),
    child: child,
  );
}