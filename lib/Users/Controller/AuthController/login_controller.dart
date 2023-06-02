import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Model/login_model.dart';
import 'package:pugau/Data/Model/place_details_model.dart';
import 'package:pugau/Data/Model/prediction_model.dart';
import 'package:pugau/Users/Auth/DashBoard.dart';
import 'package:pugau/Users/Auth/Forget/set_new_password.dart';
import 'package:pugau/Users/Auth/login.dart';
import 'package:pugau/Users/Auth/select_city.dart';
import 'package:pugau/Users/Auth/set_name_password.dart';
import 'package:pugau/Users/Auth/verify_otp.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Screens/Profile/user_profile.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Data/Model/get_profile_model.dart';

class AuthController extends GetxController implements GetxService {
  bool isLoading = false;
  Position _pickPosition = Position(longitude: 0, latitude: 0, timestamp: DateTime.now(),
      accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);
  var userProfile = Data().obs;
  List<Login1> login_list = [];
  double? lat;
  double? long;
  List<Predictions> _predictionList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserProfile();
    login_check();
  }

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
    print(res.toString());
    update();
    if (res['success'] == true) {
      if (res['type'] == "Register") {
        Get.off(VerifyOtp(
          type: 'LOGIN',
          phone: phone,
        ));
      } else {
        Get.off(Login(user_id: res['data'][0]['id'].toString()));

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
      _setValue(res['data']['id'].toString());
      if (res['type'] == "LOGIN") {
        showCustomSnackBar(res['message'].toString(), isError: false);
        Get.off(()=>SetNamePassword(
          title: '',
        ));
      } else {
        Get.off(() => SetNewPassword(
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
      Get.off(()=>SelectCity(title: '',));
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
  Future Login_password(
    String password,user_id
  ) async {
    final url = AppContent.BASE_URL + AppContent.LOGIN;
    final body = {
      'user_id': user_id,
      'password': password,
    };
    final response = await http.post(Uri.parse(url), body: body);

   
      var responseData = jsonDecode(response.body);
      if (responseData['success']==true) {
        _setValue(user_id);
        showCustomSnackBar(responseData['message'].toString(), isError: false);
        Get.off(Home(
          title: 'Title',
        ));
      }
     else {
      showCustomSnackBar(responseData['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

  // edit user profile

  Future editUserProfile(String userName, String userNumber) async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final url = AppContent.BASE_URL + AppContent.EDIT_URL;

    final body = {
      'user_id': userid,
      'name': userName,
      'phone': userNumber,
    };

    final editp = await http.post(Uri.parse(url), body: body);

    if (editp.statusCode == 200) {
      var editpData = jsonDecode(editp.body);
      if (editpData != null) {
        showCustomSnackBar(editpData['message'].toString(), isError: false);
        print(editpData['message']);
        //  print(userid);

        Get.off(UserProfile(
          title: '',
        ));
        update();
      }
    } else {
      showCustomSnackBar(editp.body.toString(), isError: false);
    }
    isLoading = false;
    update();
  }

  Future getUserProfile() async {
    try {
      isLoading = true;
      update();
      final pref = await SharedPreferences.getInstance();
      var userId = pref.getString('user_id');

      final url = AppContent.BASE_URL + AppContent.GET_USER_PROFILE;

      final body = {
        'user_id': userId,
      };

      final response = await http.post(Uri.parse(url), body: body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var profileData = Data.fromJson(jsonResponse['data']);
        userProfile.value = profileData;
        print(userProfile);
      }
      print(userProfile);
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading = false;
    }
  }


  Future login_check() async {
    try {
      final res =
      await http.get(Uri.parse(AppContent.BASE_URL + AppContent.LOGIN_BANNER));
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data']['login'];
        print(temp.toString());
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              login_list.add(Login1.fromJson(map));
              update();
            }
          }
        }
      }
      update();
      return login_list;
    } catch (e) {
      print(e.toString());
    }
  }

 /* Future login_check() async {
    try {
      isLoading = true;
      update();
      final url = AppContent.BASE_URL + AppContent.LOGIN_BANNER;
      final response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        login_list = Login1.fromJson(jsonResponse['data']);
      }
      print(userProfile);
    } catch (e) {
      print('An error occurred: $e');
    } finally {
      isLoading = false;
    }
  }*/


  Future<List<Predictions>> searchLocation(BuildContext context,String text) async {
    if(text != null && text.isNotEmpty) {
      http.Response response = await http.get(Uri.parse("https://gonearby.in/api/v1/config/place-api-autocomplete?search_text=$text"),
      headers: {'Content-Type': 'application/json; charset=UTF-8',});
      var res=jsonDecode(response.body);
      print(response.body.toString());
      update();
      if (response.statusCode == 200 ) {
        _predictionList = [];
        res['predictions'].forEach((prediction) =>
            _predictionList.add(Predictions.fromJson(prediction)));
      } else {
        showCustomSnackBar(res['error_message'] ?? res.bodyString);
      }
    }
    return _predictionList;
  }

Future<Position> setSuggestedLocation(String placeID, String address,) async {
  isLoading = true;
  update();

  LatLng _latLng = LatLng(0, 0);
  http.Response response = await http.get(Uri.parse("https://gonearby.in/api/v1/config/place-api-details?placeid=$placeID"),
      headers: {'Content-Type': 'application/json; charset=UTF-8',});
  var res=jsonDecode(response.body);
  print(res.toString()+"hiiii");
  if(response.statusCode == 200) {
    place_details_model placeDetails = place_details_model.fromJson(res);
    lat=double.parse(placeDetails.result!.geometry!.location!.lat.toString());
    long=double.parse(placeDetails.result!.geometry!.location!.lng.toString());
    update();
    _latLng = LatLng(double.parse(placeDetails.result!.geometry!.location!.lat.toString()), double.parse(placeDetails.result!.geometry!.location!.lng.toString()));
  }
  _pickPosition = Position(
    latitude: _latLng.latitude, longitude: _latLng.longitude,
    timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1,
  );
  isLoading = false;
  update();
  return _pickPosition;
}

}
