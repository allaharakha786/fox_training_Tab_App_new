import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/dimentions_resources.dart';
import 'package:fox_training/views/utills/text_styles.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? title;
  final TextEditingController? controller;
  final bool? readOnly;
  final bool? phoneKeyboard;
  final double? borderRadius;
  final double? horizentalPadding;
  final Callback? onTap;
  Widget? lineImage;
  String? prefix;
  int? maxLine;
  Color? bgColor;
  Color? borderColor;
  double? verticalPadding;

  double? width;
  String? Function(String?)? validator;
  CustomTextFormField(
      {super.key,
      this.maxLine,
      this.verticalPadding,
      this.bgColor,
      this.borderColor,
      this.title,
      this.controller,
      this.phoneKeyboard,
      this.borderRadius,
      this.horizentalPadding,
      this.readOnly,
      this.onTap,
      this.width,
      this.validator,
      this.lineImage,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;
    return TextFormField(
      validator: validator,
      controller: controller,
      readOnly: readOnly ?? false,
      maxLines: maxLine,
      cursorColor: ColorsResources.PRIMARY_COLOR,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        hintText: title ?? 'Email',
        hintStyle: CustomTextStyles.contentRegularTextStyle(
            ColorsResources.LIGHT_BLACK, DimensionsResource.D_12.sp),
        filled: true,
        fillColor: bgColor ?? const Color.fromARGB(255, 255, 245, 245),
        isCollapsed: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(color: ColorsResources.PRIMARY_COLOR),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
              color: borderColor ?? ColorsResources.TRANSPARENT_COLOR),
        ),
        contentPadding: EdgeInsets.only(
          top: mediaQuerySize.height * 0.015.h,
        ),
        prefixIcon: SizedBox(
          height: 2.4.h,
          width: width ?? 2.4.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SvgPicture.asset(prefix ?? 'assets/svg/tab_.svg'),
              ),
              const Expanded(child: SizedBox()),
              lineImage ?? SvgPicture.asset('assets/svg/vertical_line.svg'),
              const Expanded(child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}
