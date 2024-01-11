import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/profile_controller.dart';
import 'package:get/get.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  final dynamic data;
  const EditProfileScreen({super.key, required this.data});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    profileController.usernameController.text = widget.data?['username'] ?? '';
    profileController.passwordController.text = widget.data?['password'] ?? '';

    return bg(
      child: Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              profileController.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(File(profileController.profileImgPath.value),
                          width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
              10.heightBox,
              ElevatedButton(
                  onPressed: () {
                    profileController.changeImage(context);
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: redColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  child: const Text("Change")),
              const Divider(),
              20.heightBox,
              TextFormField(
                controller: profileController.usernameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust the border radius
                  ),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: profileController.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust the border radius
                  ),
                ),
              ),
              20.heightBox,
              SizedBox(
                width: context.screenWidth - 40,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: redColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const Text("Save")),
              ),
            ],
          )
              .box
              .white
              .padding(const EdgeInsets.all(16.0))
              .margin(const EdgeInsets.only(top: 50, left: 12.0, right: 12.0))
              .rounded
              .shadowSm
              .make(),
        ),
      ),
    );
  }
}

