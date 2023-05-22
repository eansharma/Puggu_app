import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/widget/customSnakebar.dart';


class FavRestaurantController extends GetxController {

  Future fechData(String customer_id,String restaurant_id) async {
    final response = await http
        .post(Uri.parse("${AppContent.BASE_URL}${AppContent.FavRestaurant}"), body: {
      'customer_id': customer_id,
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
