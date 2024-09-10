import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: mediaQuerySize.width.w,
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
                          ScreenPercentage.SCREEN_SIZE_66.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image:
                                  AssetImage('assets/png/fox_training.png')))),
                  CustomTextFormField(
                    controller: userNameController,
                    width: mediaQuerySize.width *
                        ScreenPercentage.SCREEN_SIZE_70.w,
                    hintText: 'User Name',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: mediaQuerySize.width *
                            ScreenPercentage.SCREEN_SIZE_8.w,
                        child: Row(
                          children: [
                            Expanded(
                                child: Image.asset('assets/png/user_icon.png')),
                            Expanded(
                                child: SvgPicture.asset(
                                    'assets/svg/vertical_line.svg')),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerySize.height *
                        ScreenPercentage.SCREEN_SIZE_2.h,
                  ),
                  MyButton(
                    text: 'Next',
                    onTap: () {
                      Get.to(() => MainScreen(
                            userName: userNameController.text,
                          ));
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
