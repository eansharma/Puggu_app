import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RateDeliveryController extends GetxController {
  bool isLoading = false;
  Future rateDelivary(String rate, rider_id, order_id, comment) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');

    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.RATE_DELIVERY), body: {
      'user_id': userid,
      'rider_id': rider_id,
      'order_id': order_id,
      'delivery_point': rate,
      'comment': comment,
    });
    var res = jsonDecode(response.body);

    print(res);
    if (res['status'] == true) {
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }
}
