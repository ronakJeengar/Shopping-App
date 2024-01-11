import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/auth_controller.dart';
import 'package:ecom/controller/profile_controller.dart';
import 'package:ecom/screens/auth_screen/sign_in_via_email.dart';
import 'package:ecom/screens/profile_screen/components/edit_profile.dart';
import 'package:ecom/services/firestore_services.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthController authController = Get.find<AuthController>();
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return bg(
        child: Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              // Handle the case when there is no data
              return const Center(
                child: Text('No user data found.'),
              );
            } else {
              var data = snapshot.data!.docs[0];
              return SafeArea(
                  child: Column(children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      profileController.usernameController.text = data['username'] ?? '';
                      profileController.passwordController.text = data['password'] ?? '';
                      Get.to(() => EditProfileScreen(data: data));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          data['imageUrl'] == ''?
                          Image.asset(
                            imgProfile,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                          :
                          Image.network(
                            data['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                          20.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "${data['username']}"
                                  .text
                                  .white
                                  .fontFamily(bold)
                                  .size(16)
                                  .make(),
                              "${data['email']}"
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
                        child: "log out"
                            .text
                            .white
                            .size(16)
                            .fontFamily(semibold)
                            .make(),
                      )
                          .box
                          .border(width: 1, color: Colors.white)
                          .roundedSM
                          .make()
                          .onTap(() {
                        auth.signOut();
                        Get.to(() => SignInPage());
                      }),
                    ],
                  ),
                ),
                30.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "${data['cartCount']}".text.make(),
                          10.heightBox,
                          "In Cart".text.make(),
                        ],
                      )
                          .box
                          .white
                          .width(context.screenWidth / 4)
                          .height(context.screenHeight * 0.07)
                          .roundedSM
                          .make(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "${data['wishListCount']}".text.make(),
                          10.heightBox,
                          "WishList".text.make(),
                        ],
                      )
                          .box
                          .white
                          .width(context.screenWidth / 4)
                          .height(context.screenHeight * 0.07)
                          .roundedSM
                          .make(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          "${data['orderCount']}".text.make(),
                          10.heightBox,
                          "Ordered".text.make(),
                        ],
                      )
                          .box
                          .white
                          .width(context.screenWidth / 4)
                          .height(context.screenHeight * 0.07)
                          .roundedSM
                          .make()
                    ]),
                // 20.heightBox,
                Column(
                        children: List.generate(
                  6,
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
              ]));
            }
          }),
    ));
  }
}
