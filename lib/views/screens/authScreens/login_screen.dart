import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_training/controller/getxController/auth_controller.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/screen_percentage.dart';
import 'package:fox_training/views/widgets/common_textForm_field.dart';
import 'package:fox_training/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController tabIdController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthControllers authControllers =
        Get.put(AuthControllers(context: context));
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuerySize.width * ScreenPercentage.SCREEN_SIZE_100.w,
          color: ColorsResources.WHITE_COLOR,
          child: Center(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: mediaQuerySize.height *
                            ScreenPercentage.SCREEN_SIZE_12.h,
                        width: mediaQuerySize.width *
                            ScreenPercentage.SCREEN_SIZE_65.w,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    'assets/png/fox_training.png')))),
                    SizedBox(
                      width: mediaQuerySize.width * 0.7.w,
                      child: CustomTextFormField(
                        maxLine: 1,
                        borderRadius: 30,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please fill this field';
                          }

                          return null;
                        },
                        controller: tabIdController,
                        title: 'Tab ID',
                        prefix: 'assets/svg/tab_.svg',
                        bgColor: Colors.black.withOpacity(0.04),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuerySize.height *
                          ScreenPercentage.SCREEN_SIZE_2.h,
                    ),
                    SizedBox(
                      width: mediaQuerySize.width * 0.7.w,
                      child: CustomTextFormField(
                        maxLine: 1,
                        bgColor: Colors.black.withOpacity(0.04),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please fill this field';
                          }

                          return null;
                        },
                        controller: passwordController,
                        title: 'Password',
                        prefix: 'assets/svg/password_icon.svg',
                      ),
                    ),
                    SizedBox(
                      height: mediaQuerySize.height *
                          ScreenPercentage.SCREEN_SIZE_3.h,
                    ),
                    Obx(() {
                      return MyButton(
                        isLoading: authControllers.isLoading.value,
                        text: 'Login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            authControllers.loginToTab(
                                tabId: tabIdController.text,
                                password: passwordController.text);
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
