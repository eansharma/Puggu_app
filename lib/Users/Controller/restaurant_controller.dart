import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/restaurant_model.dart';

class RestaurantController extends GetxController {
  RxList<Data> restaurantData = RxList<Data>([]);

  Future<void> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse(AppContent.BASE_URL + AppContent.RESTAURANT));
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        final model = RestaurantModel.fromJson(jsonBody);
        restaurantData.value = model.data ?? [];
      }
      print(restaurantData);
    } catch (e) {
      // Handle error
      print('Error: $e');
    }
  }
}
