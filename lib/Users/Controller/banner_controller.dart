import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Api/API_URLs.dart';

class BannerController extends GetxController {
  RxList<Map<String, dynamic>> genieData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> martData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> restaurantData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData( ) async {
    try {
      final response = await http.get(Uri.parse(AppContent.BASE_URL + AppContent.BANNER));
      if (response.statusCode == 200) {
        final data = response.body;
        final parsedData = jsonDecode(data);

        if (parsedData['data'] != null) {
          genieData.value =
              List<Map<String, dynamic>>.from(parsedData['data']['genie']);
          martData.value =
              List<Map<String, dynamic>>.from(parsedData['data']['mart']);
          restaurantData.value =
              List<Map<String, dynamic>>.from(parsedData['data']['restaurant']);
        }
        update();
      } else {
        // Handle error
      }
    } catch (e) {
      // Handle error
      print(e);
    }
  }
}
