import 'package:ecom/consts/consts.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: "Cart is empty".text.fontFamily(bold).size(16).make(),
    );
  }
}
