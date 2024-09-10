import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/dimentions_resources.dart';

// ignore: must_be_immutable
class CommonCircleAvatar extends StatelessWidget {
  TextEditingController? controller;
  CommonCircleAvatar({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionsResource.D_40.h,
      width: DimensionsResource.D_40.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsResources.BACKGROUND_COLOR,
      ),
      child: Center(
        child: TextFormField(
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(3),
          ],
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0), // Remove internal padding
            isDense: true,
            border: InputBorder.none,
          ),
          controller: controller,
        ),
      ),
    );
  }
}
