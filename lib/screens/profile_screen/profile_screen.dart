import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return bg(
        child: Scaffold(
      body: SafeArea(
          child: Column(children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    imgProfile,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  20.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Full Name".text.white.fontFamily(bold).size(16).make(),
                      "fullname@fullname.com"
                          .text
                          .white
                          .fontFamily(semibold)
                          .size(16)
                          .make()
                    ],
                  ),
                ],
              ),
              20.widthBox,
              Container(
                padding: const EdgeInsets.all(8.0),
                child:
                    "log out".text.white.size(16).fontFamily(semibold).make(),
              )
                  .box
                  .border(width: 1, color: Colors.white)
                  .roundedSM
                  .make()
                  .onTap(() {}),
            ],
          ),
        ),
        30.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "12".text.make(),
                      10.heightBox,
                      "in your cart".text.make(),
                    ],
                  )
                      .box
                      .white
                      .width(context.screenWidth / 4)
                      .height(context.screenHeight * 0.07)
                      .roundedSM
                      .make()),
        ),
        // 20.heightBox,
        Column(
                children: List.generate(6,
          (index) => Column(children: [
            ListTile(
              leading: Image.asset(
                icWallet,
                width: 20,
              ),
              title: "MY Wallet".text.make(),
              onTap: () {},
            ),
            if (index < 5)
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            // Add Divider for all items except the last one
          ]),
        ))
            .box
            .white
            .roundedSM
            .margin(const EdgeInsets.all(16.0))
            .padding(const EdgeInsets.all(12.0))
            .shadowSm
            .make()
            .box
            .color(redColor)
            .make()
      ])),
    ));
  }
}
