import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/dimentions_resources.dart';
import 'package:fox_training/views/utills/text_styles.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? readOnly;
  final bool? phoneKeyboard;
  final double? borderRadius;
  final double? horizentalPadding;
  final Callback? onTap;
  double width;
  CustomTextFormField(
      {super.key,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.obscureText = false,
      this.phoneKeyboard,
      this.borderRadius,
      this.horizentalPadding,
      this.readOnly,
      this.onTap,
      required this.width});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: horizentalPadding ?? 1.2.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: ColorsResources.BACKGROUND_COLOR),
      child: TextFormField(
        onTap: onTap,
        keyboardType: phoneKeyboard == true ? TextInputType.phone : null,
        controller: controller,
        // style: TextStyles.buttonText.copyWith(color: const Color(0xff444444)),
        // controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: Colors.black,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: CustomTextStyles.contentRegularTextStyle(
                ColorsResources.LIGHT_BLACK, DimensionsResource.D_12.sp),
            contentPadding:
                EdgeInsets.symmetric(vertical: mediaQuerySize.height * 0.02.h),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,

            // isDense: true,

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 36),
              borderSide: BorderSide(color: ColorsResources.BACKGROUND_COLOR),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3.h),
                borderSide: BorderSide.none),
            enabledBorder: InputBorder.none),
      ),
    );
  }
}
