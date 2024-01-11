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
    var userData = widget.data;

    return bg(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //data of image url is empty and image path is empty
              userData['imageUrl'] == '' &&
                      profileController.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  // data of image url is not empty but the image path is empty
                  : userData['imageUrl'] != '' &&
                          profileController.profileImgPath.isEmpty
                      ? Image.network(
                          userData['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      //If the image url is empty
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
                controller: profileController.oldPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Old Password',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust the border radius
                  ),
                ),
              ),
              20.heightBox,
              TextFormField(
                controller: profileController.newPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Adjust the border radius
                  ),
                ),
              ),
              20.heightBox,
              profileController.isLoading.value
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 40,
                      child: ElevatedButton(
                          onPressed: () async {
                            profileController.isLoading(true);
                            if (profileController.profileImgPath.isNotEmpty) {
                              await profileController.uploadProfileImage();
                            } else {
                              profileController.profileImageLink =
                                  userData['imageUrl'];
                            }

                            //If old password matches with the current user database password
                            if (userData['password'] ==
                                profileController.oldPasswordController.text) {
                              //authenticate after checking the password
                              await profileController.changeAuthPassword(
                                  email: userData['email'],
                                  password: profileController
                                      .oldPasswordController.text,
                                  newpassword: profileController
                                      .newPasswordController.text);

                              await profileController.updateProfile(
                                  imageUrl: profileController.profileImageLink,
                                  username:
                                      profileController.usernameController.text,
                                  password: profileController
                                      .newPasswordController.text);
                              VxToast.show(context, msg: "Profile updated");
                            } else {
                              VxToast.show(context,
                                  msg: "Password did not match.");
                              profileController.isLoading(false);
                            }
                          },
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
