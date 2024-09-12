import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fox_training/controller/getxController/auth_controller.dart';
import 'package:fox_training/controller/utils/screen_percentage.dart';
import 'package:fox_training/controller/utils/colors_resources.dart';
import 'package:fox_training/controller/utils/dimentions_resources.dart';
import 'package:fox_training/views/screens/authScreens/username_screen.dart';
import 'package:fox_training/views/utills/text_styles.dart';
import 'package:fox_training/views/widgets/common_circle_avatar.dart';
import 'package:fox_training/views/widgets/custom_button.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  String userName;

  MainScreen({super.key, required this.userName});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> titleText = ['Set', 'Previous', 'Lbs', 'Reps'];

  RxList<String> sets = [
    '1',
  ].obs;

  RxList<TextEditingController> repsController = <TextEditingController>[].obs;

  final RxString _selectedDifficulty = 'Level 1'.obs;

  // TextEditingController lbsController = TextEditingController();
  late AuthControllers authControllers;
  @override
  void initState() {
    authControllers = Get.put(AuthControllers(context: context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('data == ${authControllers.lbsControllers[0].text}');
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorsResources.WHITE_COLOR));
    Size mediaQuerySize = MediaQuery.of(context).size;

    return Obx(() {
      return Scaffold(
        backgroundColor: ColorsResources.WHITE_COLOR,
        body: SafeArea(
          child: Container(
            color: ColorsResources.WHITE_COLOR,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mediaQuerySize.height *
                        ScreenPercentage.SCREEN_SIZE_5.h,
                  ),
                  Stack(children: [
                    Center(
                      child: SizedBox(
                        width: mediaQuerySize.width * 0.6.w,
                        child: Image.asset(
                            fit: BoxFit.cover, 'assets/png/fox_training.png'),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(
                        DimensionsResource.PADDING_SIZE_NORMAL),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'WEEK 2',
                          style: CustomTextStyles.headingBoldTextStyle(
                              ColorsResources.PRIMARY_COLOR,
                              DimensionsResource.FONT_SIZE_MEDIUM),
                        ),
                        Text(
                          'Full Body Burner',
                          overflow: TextOverflow.ellipsis,
                          style: CustomTextStyles.headingBoldTextStyle(
                              ColorsResources.BLACK_COLOR,
                              DimensionsResource.FONT_SIZE_3X_EXTRA_LARGE),
                        ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: DimensionsResource.PADDING_SIZE_DEFAULT,
                                bottom:
                                    DimensionsResource.PADDING_SIZE_DEFAULT),
                            child: SizedBox(
                              width: mediaQuerySize.height * 1.h,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.userName.contains('1')
                                        ? exerciseTitle[0]
                                        : widget.userName.contains('2')
                                            ? exerciseTitle[1]
                                            : widget.userName.contains('3')
                                                ? exerciseTitle[2]
                                                : exerciseTitle[03],
                                    style:
                                        CustomTextStyles.headingBoldTextStyle(
                                            ColorsResources.BLACK_COLOR,
                                            DimensionsResource
                                                .FONT_SIZE_2X_EXTRA_MEDIUM.sp),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height *
                                        ScreenPercentage.SCREEN_SIZE_1.h,
                                  ),
                                  Text(
                                    widget.userName.contains('1')
                                        ? exerciseType[0]
                                        : widget.userName.contains('2')
                                            ? exerciseType[1]
                                            : widget.userName.contains('3')
                                                ? exerciseType[2]
                                                : exerciseType[03],
                                    style:
                                        CustomTextStyles.headingBoldTextStyle(
                                            ColorsResources.PRIMARY_COLOR,
                                            DimensionsResource
                                                .FONT_SIZE_1X_EXTRA_MEDIUM),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          border: Border.all(
                                              color:
                                                  ColorsResources.LIGHT_BLACK)),
                                      child: DropdownButton<String>(
                                        icon: Padding(
                                          padding:
                                              EdgeInsets.only(right: 4.0.sp),
                                          child: const Icon(
                                              Icons.keyboard_arrow_down),
                                        ),
                                        value: _selectedDifficulty.value,
                                        items: <String>[
                                          'Level 1',
                                          'Level 2',
                                          'Level 3'
                                        ].map((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                value,
                                                style: CustomTextStyles
                                                    .contentRegularTextStyle(
                                                        ColorsResources
                                                            .BLACK_COLOR,
                                                        DimensionsResource
                                                            .D_14.sp),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          _selectedDifficulty.value = newValue!;
                                        },
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        iconSize: 24,
                                      )),
                                  SizedBox(
                                    height: mediaQuerySize.height *
                                        ScreenPercentage.SCREEN_SIZE_1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                        titleText.length,
                                        (index) => Text(
                                              titleText[index],
                                              style: CustomTextStyles
                                                  .headingBoldTextStyle(
                                                      ColorsResources
                                                          .BLACK_COLOR,
                                                      DimensionsResource
                                                          .FONT_SIZE_1X_EXTRA_MEDIUM),
                                              textAlign: TextAlign.center,
                                            )),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.01.h,
                                  ),
                                  Column(
                                    children: List.generate(
                                        authControllers.lbsControllers.length,
                                        (index) => Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left:
                                                              DimensionsResource
                                                                  .D_9),
                                                  child: Text(
                                                    ' ${index + 1}',
                                                    style: CustomTextStyles
                                                        .contentRegularTextStyle(
                                                            ColorsResources
                                                                .BLACK_COLOR,
                                                            DimensionsResource
                                                                .FONT_SIZE_MEDIUM),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: DimensionsResource
                                                          .D_20.sp),
                                                  child: SvgPicture.asset(
                                                      'assets/svg/horizantal_line.svg'),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        left: DimensionsResource
                                                            .D_10.sp),
                                                    child: CommonCircleAvatar(
                                                      controller: authControllers
                                                              .lbsControllers[
                                                          index],
                                                    )),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      bottom: DimensionsResource
                                                          .PADDING_SIZE_DEFAULT,
                                                      right: DimensionsResource
                                                          .D_0),
                                                  child: CommonCircleAvatar(
                                                    controller: authControllers
                                                        .repsController[index],
                                                  ),
                                                )
                                              ],
                                            )),
                                  ),
                                  SizedBox(
                                    height: mediaQuerySize.height * 0.02.h,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      authControllers.lbsControllers
                                          .add(TextEditingController());
                                      authControllers.repsController
                                          .add(TextEditingController());
                                      // int newValue = int.parse(sets.last) + 1;
                                      // sets.add(newValue.toString());
                                      // lbsControllers
                                      //     .add(TextEditingController());
                                      // repsController
                                      //     .add(TextEditingController());
                                    },
                                    child: Container(
                                      width: mediaQuerySize.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              DimensionsResource.D_48),
                                          color:
                                              ColorsResources.BACKGROUND_COLOR),
                                      child: Padding(
                                        padding: const EdgeInsets.all(
                                            DimensionsResource
                                                .PADDING_SIZE_DEFAULT),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: mediaQuerySize.height *
                                                  ScreenPercentage
                                                      .SCREEN_SIZE_3.h,
                                              width: mediaQuerySize.width *
                                                  ScreenPercentage
                                                      .SCREEN_SIZE_4.w,
                                              child: SvgPicture.asset(
                                                'assets/svg/plus_icon.svg',
                                              ),
                                            ),
                                            SizedBox(
                                              width:
                                                  mediaQuerySize.width * 0.01.w,
                                            ),
                                            Text(
                                              'Add Set',
                                              style: CustomTextStyles
                                                  .contentRegularTextStyle(
                                                      ColorsResources
                                                          .BLACK_COLOR,
                                                      DimensionsResource
                                                          .FONT_SIZE_MEDIUM),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )

                        // userName.contains('1')
                        //     ? Center(
                        //         child: DetailBox(
                        //           exerciseTitle: exerciseTitle[0],
                        //           exerciseType: exerciseType[0],
                        //           set: sets[0],
                        //           reps: reps[0],
                        //           setsLength: sets[0].length,
                        //         ),
                        //       )
                        //     : userName.contains('2')
                        //         ? Center(
                        //             child: DetailBox(
                        //               exerciseTitle: exerciseTitle[1],
                        //               exerciseType: exerciseType[1],
                        //               set: sets[0],
                        //               reps: reps[0],
                        //               setsLength: sets[0].length,
                        //             ),
                        //           )
                        //         : userName.contains('3')
                        //             ? Center(
                        //                 child: DetailBox(
                        //                   exerciseTitle: exerciseTitle[2],
                        //                   exerciseType: exerciseType[2],
                        //                   set: sets[0],
                        //                   reps: reps[0],
                        //                   setsLength: sets[0].length,
                        //                 ),
                        //               )
                        //             : Center(
                        //                 child: DetailBox(
                        //                   exerciseTitle: exerciseTitle[3],
                        //                   exerciseType: exerciseType[3],
                        //                   set: sets[0],
                        //                   reps: reps[0],
                        //                   setsLength: sets[0].length,
                        //                 ),
                        //               )

                        // Column(
                        //   children: List.generate(
                        //       1,
                        //       (index) => DetailBox(
                        //             exerciseTitle: ListData.exerciseTitle[index],
                        //             exerciseType: ListData.exerciseType[index],
                        //             set: ListData.sets[index],
                        //             reps: ListData.reps[index],
                        //             setsLength: ListData.sets[index].length,
                        //           )),
                        // )
                      ],
                    ),
                  ),
                  Center(
                      child: MyButton(
                    text: 'Save Workout',
                    onTap: () {
                      Get.to(() => UsernameScreen());
                    },
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  List<String> reps = [
    '10',
  ];

  List<String> exerciseTitle = [
    'Station 1',
    'Station 2',
    'Station 3',
    'Station 4'
  ];

  List<String> exerciseType = [
    'Squat(Barbell)',
    'Leg Extention(Machine)',
    'Flat Leg Raise',
    'Leg Press'
  ];
}
