import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/screen_percentage.dart';
import 'package:fox_training/views/screens/authScreens/username_screen.dart';
import 'package:fox_training/views/widgets/common_textForm_field.dart';
import 'package:fox_training/views/widgets/custom_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuerySize.width * ScreenPercentage.SCREEN_SIZE_100.w,
          color: ColorsResources.WHITE_COLOR,
          child: Center(
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
                              image:
                                  AssetImage('assets/png/fox_training.png')))),
                  CustomTextFormField(
                    width: mediaQuerySize.width *
                        ScreenPercentage.SCREEN_SIZE_70.w,
                    hintText: ' Tab ID',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: mediaQuerySize.width *
                            ScreenPercentage.SCREEN_SIZE_10.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                                child: SvgPicture.asset('assets/svg/tab_.svg')),
                            Expanded(
                                child: SvgPicture.asset(
                                    'assets/svg/vertical_line.svg'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height *
                        ScreenPercentage.SCREEN_SIZE_2.h,
                  ),
                  CustomTextFormField(
                    width: mediaQuerySize.width *
                        ScreenPercentage.SCREEN_SIZE_70.w,
                    hintText: ' Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: mediaQuerySize.width *
                            ScreenPercentage.SCREEN_SIZE_10.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SvgPicture.asset(
                                'assets/svg/password_icon.svg',
                              ),
                            ),
                            Expanded(
                                child: SvgPicture.asset(
                                    'assets/svg/vertical_line.svg'))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height *
                        ScreenPercentage.SCREEN_SIZE_3.h,
                  ),
                  MyButton(
                    text: 'Login',
                    onTap: () {
                      Get.to(() => UsernameScreen());
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
