import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Data/Api/API_URLs.dart';

class FeedbackController extends GetxController {
  bool isLoading = false;
  Future<void> setNewPassword(
    String feedback,
  ) async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    final url = AppContent.BASE_URL + AppContent.COMPLAINT;
    final body = {
      'user_id': userid,
      'new_password': feedback,
    };

    final response = await http.post(Uri.parse(url), body: body);

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);
      if (responseData != null) {
        showCustomSnackBar(responseData['message'].toString(), isError: false);
        print(responseData['message']);
        //  print(userid);
      }
    } else {
      showCustomSnackBar(response.body.toString(), isError: false);
    }
    isLoading = false;
    update();
  }
}
