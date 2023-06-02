import 'dart:convert';

import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartController extends GetxController {
  bool isLoading = false;
  // For reset Password
  Future Add_to_Cart(String submenu_id, price, qty, size) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');

    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.ADD_TO_CART), body: {
      'user_id': userid,
      'submenu_id': submenu_id,
      'price': price,
      'qty': qty,
      'size': size,
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
