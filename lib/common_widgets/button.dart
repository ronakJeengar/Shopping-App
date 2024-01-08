import 'package:ecom/consts/consts.dart';
import 'package:get/get.dart';

Widget textButton(
    {required String? buttonName,
    required Color? textColor,
    required Color? buttonColor,
    required Widget? screen}) {
  return TextButton(
    onPressed: () {
      Get.to(() => screen);
    },
    child: Text(
      buttonName!,
      style: const TextStyle(fontSize: 18),
    ),
  );
}

Widget textGestureButton(
    {required String buttonName,
    required Color textColor,
    required Widget screen,
    required Alignment alignment}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => screen);
    },
    child: Align(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor,
            fontSize: 14.0,
          ),
        ),
      ),
    ),
  );
}

Widget elevatedBtnFunction(
    {required String? buttonName,
    required Color? textColor,
    required Color? buttonColor,
    required VoidCallback onPressedCallback}) {
  return ElevatedButton(
      onPressed: () {
        onPressedCallback;
      },
      style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Text(
        buttonName!,
        style: const TextStyle(fontSize: 18),
      ));
}

Widget elevatedBtnScreen(
    {required String? buttonName,
    required Color? textColor,
    required Color? buttonColor,
    required Widget? screen}) {
  return ElevatedButton(
      onPressed: () {
        Get.to(() => screen);
      },
      
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        )
      ),
      child: Text(
        buttonName!,
        style: const TextStyle(fontSize: 18),
      ));
}

Widget buildDateField({
  required TextEditingController? controller,
  required String? label,
  required Color? color,
  required VoidCallback? onPressedCallback,
}) {
  return TextFormField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      suffixIcon: IconButton(
        onPressed: onPressedCallback,
        icon: const Icon(Icons.calendar_month),
      ),
      floatingLabelStyle: TextStyle(color: color),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color!, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    readOnly: true,
  );
}

Widget homeButton({required double? height, required double? width, required String? icon, required String? title }){
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon!, width: 26),
        10.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ),
  ).box.rounded.white.size(width!, height!).make();
}
