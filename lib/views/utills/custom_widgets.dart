import 'package:flutter/material.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';

customScaffoldMessenger(
  BuildContext context,
  String text,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: ColorsResources.BLACK_COLOR,
      duration: const Duration(seconds: 2),
    ),
  );
}
