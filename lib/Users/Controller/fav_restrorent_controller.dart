
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class FavRestaurantController extends GetxController {


   final List<bool> likedRestaurants = [];



  Future fechData(String restaurant_id) async {

    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    print("USER ID FROM fav_restrorent_controller-  $userid");

    final response = await http
        .post(Uri.parse("${AppContent.BASE_URL}${AppContent.FavRestaurant}"), body: {
      'customer_id': userid,
      'restaurant_id': restaurant_id,
    });
      var temp = jsonDecode(response.body);
      if(temp['success']==true){
        showCustomSnackBar(temp['message'].toString(), isError: false);
      }
      else{
        showCustomSnackBar(temp['message'].toString(), isError: true);
      }
    update();
  }
}
