import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_training/controller/apis/auth_apis.dart';
import 'package:fox_training/controller/getxController/auth_controller.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/screen_percentage.dart';
import 'package:fox_training/views/screens/main_screen.dart';
import 'package:fox_training/views/widgets/common_textForm_field.dart';
import 'package:fox_training/views/widgets/custom_button.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UsernameScreen extends StatelessWidget {
  UsernameScreen({super.key});
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> form = GlobalKey();
  @override
  Widget build(BuildContext context) {
    AuthControllers authControllers =
        Get.put(AuthControllers(context: context));
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuerySize.width.w,
          color: ColorsResources.WHITE_COLOR,
          child: Center(
            child: Form(
              key: form,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: mediaQuerySize.height *
                            ScreenPercentage.SCREEN_SIZE_12.h,
                        width: mediaQuerySize.width *
                            ScreenPercentage.SCREEN_SIZE_66.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    'assets/png/fox_training.png')))),
                    SizedBox(
                      width: mediaQuerySize.width * 0.7.w,
                      child: CustomTextFormField(
                        maxLine: 1,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please fill this field';
                          }

                          return null;
                        },
                        controller: userNameController,
                        title: 'User Name',
                        prefix: 'assets/svg/user_icon.svg',
                        bgColor: Colors.black.withOpacity(0.04),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuerySize.height *
                          ScreenPercentage.SCREEN_SIZE_2.h,
                    ),
                    Obx(() {
                      return MyButton(
                        isLoading: authControllers.isLoading.value,
                        text: 'Next',
                        onTap: () {
                          if (form.currentState!.validate()) {
                            authControllers.loginToAccount(
                                userName: userNameController.text);
                            // Get.to(() => MainScreen(
                            //       userName: userNameController.text,
                            //     ));
                          }
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
