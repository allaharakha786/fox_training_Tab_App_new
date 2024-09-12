import 'dart:convert';

import 'package:fox_training/controller/utils/constants.dart';
import 'package:fox_training/controller/utils/shared_preferences.dart';
import 'package:fox_training/models/user_workout_model.dart';
import 'package:fox_training/views/screens/authScreens/username_screen.dart';
import 'package:fox_training/views/screens/main_screen.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class AuthAPis {
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
        Get.to(() => UsernameScreen());
      } else {
        print('status code ${response.body} ');
      }
    } catch (e) {
      print('status code catch');
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
        print('login to account= ${response.body}');

        final body = jsonDecode(response.body);
        Get.to(() => MainScreen(userName: userName));
        return userWorkoutModelFromJson(response.body);
        // MySharedPreferences.setString(userTokenKey, body['token']);
        // Get.to(() => UsernameScreen());
      } else {
        print('status code ${response.body} ');
      }
    } catch (e) {
      print('status code catch');
    }
  }
}
