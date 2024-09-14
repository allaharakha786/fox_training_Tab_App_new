import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fox_training/controller/utils/constants.dart';
import 'package:fox_training/controller/utils/shared_preferences.dart';
import 'package:fox_training/models/user_workout_model.dart';
import 'package:fox_training/views/screens/authScreens/login_screen.dart';
import 'package:fox_training/views/screens/main_screen.dart';
import 'package:fox_training/views/utills/custom_widgets.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

import '../../views/screens/authScreens/username_screen.dart';

class AuthAPis {
  BuildContext context;
  AuthAPis({required this.context});

  loginToTabApi({required String tabId, required String password}) async {
    final url = Uri.parse('$baseUrl$loginToTab');
    Map<String, String> body = ({"tabId": tabId, "password": password});
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      final response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        MySharedPreferences.setString(userTokenKey, body['token']);
        if (context.mounted) {
          customScaffoldMessenger(context, body['msg']);
        }
        Get.to(() => UsernameScreen());
      } else {
        final data = jsonDecode(response.body);
        if (context.mounted) {
          customScaffoldMessenger(context, data['message']);
        }
        // print('status code ${response.body} ${data['message']} ');
      }
    } catch (e) {
      if (context.mounted) {
        customScaffoldMessenger(context, e.toString());
      }
      // print('status code catch $e');
    }
  }

  loginToAccount({required String userName}) async {
    final url = Uri.parse('$baseUrl$logintoAccounts');
    Map<String, String> body = ({"username": userName});
    final token = MySharedPreferences.getString(userTokenKey);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // If authentication is needed
    };
    try {
      final response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      if (response.statusCode == 200) {
        Get.to(() => MainScreen());
        print('login to account= ${response.body}');

        final body = jsonDecode(response.body);
        // Get.off(() => MainScreen(userName: userName));
        // Get.to(() => UsernameScreen());

        return userWorkoutModelFromJson(response.body);
        // MySharedPreferences.setString(userTokenKey, body['token']);
      } else {
        customScaffoldMessenger(context, 'Something went wrong');

        print('status code ${response.statusCode} ');
      }
    } catch (e) {
      if (context.mounted) {
        customScaffoldMessenger(context, e.toString());
      }
      print('status code catch $e');
    }
  }

  saveWorkoutDataApi({required Workout workout}) async {
    final url = Uri.parse('$baseUrl$saveWorkout');

    final token = MySharedPreferences.getString(userTokenKey);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // If authentication is needed
    };
    try {
      final body = json.encode(workout.toJson());
      // print(body);

      final response = await http.post(url, body: body, headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        if (context.mounted) {
          customScaffoldMessenger(context, data['msg']);
        }

        print('if workout');
        print('workout saved if= ${response.statusCode}, = ${response.body}');
        // if (context.mounted) {
        // print('workout saved else= ${response.statusCode}= ${response.body}');

        // if (context.mounted) {
        //   customScaffoldMessenger(context, data['msg']);
        // }

        // }

        Get.off(() => LoginScreen());
      } else {
        final data = jsonDecode(response.body);

        if (context.mounted) {
          customScaffoldMessenger(context, data['message']);
        }

        print('workout saved else= ${response.statusCode}= ${response.body}');
      }
    } catch (e) {
      if (context.mounted) {
        customScaffoldMessenger(context, e.toString());
      }
      print('save workout  catch $e');
    }
  }
}
