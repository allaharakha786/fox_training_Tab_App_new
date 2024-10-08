import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/dimentions_resources.dart';
import 'package:fox_training/views/utills/text_styles.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  void Function()? onTap;
  String text;
  bool isLoading;
  Color? color;
  MyButton(
      {super.key,
      this.onTap,
      required this.text,
      required this.isLoading,
      this.color});

  @override
  Widget build(BuildContext context) {
    Size mediaQuerySize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: mediaQuerySize.width * 0.7.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp),
            color: color ?? ColorsResources.PRIMARY_COLOR),
        child: Center(
            child: isLoading
                ? Padding(
                    padding: EdgeInsets.all(6.sp),
                    child: CircularProgressIndicator(
                      color: ColorsResources.WHITE_COLOR,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: 11.sp, bottom: 11.sp),
                    child: Text(
                      text,
                      style: CustomTextStyles.headingBoldTextStyle(
                          ColorsResources.WHITE_COLOR,
                          DimensionsResource.D_16.sp),
                    ),
                  )),
      ),
    );
  }
}
