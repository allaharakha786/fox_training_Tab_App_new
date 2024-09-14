import 'package:flutter/material.dart';
import 'package:fox_training/controller/apis/auth_apis.dart';
import 'package:fox_training/models/user_workout_model.dart';
import 'package:get/get.dart';

class AuthControllers extends GetxController {
  BuildContext context;
  AuthControllers({required this.context});
  RxList<TextEditingController> lbsControllers = <TextEditingController>[].obs;
  RxList<TextEditingController> repsController = <TextEditingController>[].obs;
  RxBool isLoading = false.obs;

  Rx<UserWorkoutModel> userWorkoutData = UserWorkoutModel(
          message: '',
          workout: Workout(
              station:
                  Station(exerciseName: '', stationNumber: 0, sets: [], id: ''),
              userId: '',
              weekNumber: 0,
              programId: '',
              workOutId: ''))
      .obs;

  loginToAccount({required String userName}) async {
    isLoading.value = true;
    lbsControllers.clear();
    var myData =
        await AuthAPis(context: context).loginToAccount(userName: userName);
    try {
      if (myData != null) {
        userWorkoutData.value = myData;

        for (var i = 0;
            i < userWorkoutData.value.workout.station.sets.length;
            i++) {
          lbsControllers.add(TextEditingController(
              text: userWorkoutData.value.workout.station.sets[i].lbs
                  .toString()));
          repsController.add(TextEditingController(
              text: userWorkoutData.value.workout.station.sets[i].reps
                  .toString()));
        }
        isLoading.value = false;

        print('Data retrived done');
      } else {
        isLoading.value = false;

        print('data not retrived');
      }
    } catch (e) {
      isLoading.value = false;

      print('data not retrived catch');

      print(e);
    }
  }

  Future<void> loginToTab(
      {required String tabId, required String password}) async {
    try {
      isLoading.value = true;

      await AuthAPis(context: context)
          .loginToTabApi(tabId: tabId, password: password);

      print('login Sucessfully');
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }

  Future<void> saveWorkout({
    required Workout workout,
  }) async {
    try {
      isLoading.value = true;
      await AuthAPis(context: context).saveWorkoutDataApi(workout: workout);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;

      print(e);
    }
  }
}
