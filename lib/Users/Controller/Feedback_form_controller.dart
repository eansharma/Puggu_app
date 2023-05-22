import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../Data/Api/API_URLs.dart';

class FeedbackController extends GetxController {
  bool isLoading = false;
  // Future RaisedComplaint(
  //   String _selectedType, feedback, _selectedLocation, name, phone,
  // ) async {
  //   final pref = await SharedPreferences.getInstance();
  //   var userid = pref.getString('user_id');
  //   final url = AppContent.BASE_URL + AppContent.COMPLAINT;
  //   final body = {
  //     'user_id': userid,
  //     'type': _selectedType,
  //     'message': feedback,
  //     'selectedLocation': _selectedLocation,
  //     'name': name,
  //     'phone': phone,
  //   };
  //   print(body.toString());

  //   final response = await http.post(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var responseData = jsonDecode(response.body);
  //     if (responseData['status'] == true) {
  //       showCustomSnackBar(responseData['message'].toString(), isError: false);
  //       print(responseData['message']);
  //       //  print(userid);
  //     } else {
  //       showCustomSnackBar(responseData['message'].toString(), isError: false);
  //     }
  //   }
  //   isLoading = false;
  //   update(); 
  // }



}
