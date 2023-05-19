import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Model/coopan_model.dart';

import '../../Data/Api/API_URLs.dart';

class CoopanController extends GetxController {
  var coopanData = <Data>[].obs;

  var _isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoopanData();
  }

  // Select
  Future fetchCoopanData() async {
    try {
      _isLoading(); // Call the function to set isLoading to true

      var request = http.Request(
          'GET', Uri.parse(AppContent.BASE_URL + AppContent.COOPAN));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());

        var jsonResponse = await response.stream.bytesToString();

        // Use the first element of the list returned by jsonDecode()
        coopan_model coopanModel =
            coopan_model.fromJson(jsonDecode(jsonResponse));

        coopanData.value = coopanModel.data!;
        // print(CityList);
      }
      update();
    } catch (e) {
      print(e);
    } finally {
      _isLoading(false); // Set isLoading to false
    }
  }
}
