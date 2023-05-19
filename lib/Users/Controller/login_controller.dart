import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Users/Auth/DashBoard.dart';
import 'package:pugau/Users/Auth/Forget/set_new_password.dart';
import 'package:pugau/Users/Auth/login.dart';
import 'package:pugau/Users/Auth/set_name_password.dart';
import 'package:pugau/Users/Auth/verify_otp.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/Profile/user_profile.dart';

class AuthController extends GetxController implements GetxService {
  bool isLoading = false;

  void _setValue(value) async {
    final pref = await SharedPreferences.getInstance();
    var set1 = pref.setString('user_id', value);
  }

// for Genrate Otp
  Future<void> generateOTP(String phone) async {
    isLoading = true;
    update();
    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.OTP_GENRATION_URL),
        body: {'phone_no': phone});
    var res = jsonDecode(response.body);

    print(res);
    if (res['success'] == true) {
      if (res['type'] == "Register") {
        Get.to(VerifyOtp(
          type: 'LOGIN',
          phone: phone,
        ));
      } else {
        _setValue(res['user']['id'].toString());
        Get.to(Login());
      }
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

// for Verify Otp
  Future<void> Verify_OTP(String otp, type, phone) async {
    isLoading = true;
    update();

    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.VERIFY_OTP), body: {
      'otp': otp,
      'phone_no': phone,
      'type': type.toString(),
    });
    var res = jsonDecode(response.body);
    print(res.toString() + "hiiii");
    if (res['success'] == true) {
      _setValue(res['user']['id'].toString());
      if (res['type'] == "LOGIN") {
        showCustomSnackBar(res['message'].toString(), isError: false);
        Get.to(SetNamePassword(
          title: '',
        ));
      } else {
        Get.to(() => SetNewPassword(
              title: '',
            ));
        showCustomSnackBar(res['message'].toString(), isError: false);
      }
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

  // For Register User
  Future<void> User_Register(
    String name,
    String password,
    String city,
    String address,
    String phone,
  ) async {
    isLoading = true;
    update();

    final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');

    final response = await http.post(
      Uri.parse(AppContent.BASE_URL + AppContent.REGISTER_USER),
      body: {
        'name': name,
        'password': password,
        'user_id': userId,
        'phone': phone,
        'city': city,
        'address': address,
      },
    );

    var res = jsonDecode(response.body);

    if (res['success'] == true) {
      showCustomSnackBar(res['message'].toString(), isError: false);
      print(userId);
      Get.to(Login());
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }

    isLoading = false;
    update();
  }

  // change password

  Future<void> changePassword(
      String oldPassword, String newPassword, String confirmNewPassword) async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final url = AppContent.BASE_URL + AppContent.CHANGE_PASS;
    final body = {
      'user_id': userid,
      'old_password': oldPassword,
      'new_password': newPassword,
      'new_confirm_password': confirmNewPassword,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData != null) {
        showCustomSnackBar(responseData['message'].toString(), isError: false);
        print(responseData['message']);
        //  print(userid);

        Get.to(UserProfile(
          title: '',
        ));
        update();
      }
    } else {
      showCustomSnackBar(response.body.toString(), isError: false);
    }
    isLoading = false;
    update();
  }

  // For reset Password
  Future<void> resetPassword(
    String phone_no,
  ) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');

    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.RESET_PASSWORD),
        body: {
          'phone_no': phone_no,
          'user_id': userid,
        });
    var res = jsonDecode(response.body);

    print(res);
    if (res['success'] == true) {
      Get.to(VerifyOtp(
        type: 'RESET',
        phone: phone_no,
      ));
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

  //for SET NEW PASSWORD

  Future<void> setNewPassword(
      String newPassword, String confirmNewPassword) async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final url = AppContent.BASE_URL + AppContent.SET_NEW_PASSWORD;
    final body = {
      'user_id': userid,
      'new_password': newPassword,
      'new_confirm_password': confirmNewPassword,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData != null) {
        showCustomSnackBar(responseData['message'].toString(), isError: false);
        print(responseData['message']);
        //  print(userid);

        Get.to(Home(
          title: 'Title',
        ));
        update();
      }
    } else {
      showCustomSnackBar(response.body.toString(), isError: false);
    }
    isLoading = false;
    update();
  }

//for Login with password
  Future<void> Login_password(
    String password,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final url = AppContent.BASE_URL + AppContent.LOGIN;
    final body = {
      'user_id': userid,
      'password': password,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData != null) {
        showCustomSnackBar(responseData['message'].toString(), isError: false);
        print(responseData['message']);
        //  print(userid);

        Get.to(Home(
          title: 'Title',
        ));
        update();
      }
    } else {
      showCustomSnackBar(response.body.toString(), isError: false);
    }
    isLoading = false;
    update();
  }
}
