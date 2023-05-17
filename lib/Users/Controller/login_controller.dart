import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Users/Auth/DashBoard.dart';
import 'package:pugau/Users/Auth/set_name_password.dart';
import 'package:pugau/Users/Auth/verify_otp.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Screens/user_profile.dart';

class AuthController extends GetxController implements GetxService {
  bool isLoading = false;

  void _setValue(value) async {
    final pref = await SharedPreferences.getInstance();
    var set1 = pref.setString('user_id', value);
  }

  Future<void> generateOTP(String phone) async {
    isLoading = true;
    update();
    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.OTP_GENRATION_URL),
        body: {'phone': phone});
    var res = jsonDecode(response.body);
    _setValue(res['user']['id'].toString());
    print(res);
    if (res['code'] == 200) {
      Get.to(VerifyOtp(title: ''));
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

  Future<void> Verify_OTP(String otp,) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.VERIFY_OTP), body: {
      'otp': otp,
      'user_id': userid.toString(),
    });
    var res = jsonDecode(response.body);
    print(res.toString() + "hiiii");
    if (res['statuscode'] == 200) {
      Get.to(SetNamePassword(
        title: '',
      ));
      showCustomSnackBar(res['massage'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['massage'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

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
    var userid = pref.getString('user_id');
    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.REGISTER_USER), body: {
      'name': name,
      'password': password,
      'userid': userid,
      'phone': phone,
      'city': city,
      'address': address,
    });
    var res = jsonDecode(response.body);

    if (res['code'] == 200) {
      showCustomSnackBar(res['message'].toString(), isError: false);
      Get.to(Home(
        title: '',
      ));
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

    
       
       // change password
       

  Future<void> changePassword(String oldPassword, String newPassword, String confirmNewPassword) async {
   final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('50');
  final url = AppContent.BASE_URL+AppContent.CHANGE_PASS;
  final body = {
    'user_id': userid,
    'old_password': oldPassword,
    'new_password': newPassword,
    'new_confirm_password': confirmNewPassword,
  };

  final response = await http.post(Uri.parse(url), body: body);

  if (response.statusCode == 200) {

    showCustomSnackBar(response.body.toString(), isError: false);
    Get.to(UserProfile(title: '',));
    update();
  
    

  } else {
        showCustomSnackBar(response.body.toString(), isError: false);
  
  }
  isLoading = false;
  update();
}

  }
