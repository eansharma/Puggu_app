import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/banner_model.dart';

class BannerController extends GetxController{

var myBanner =<Data>[].obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchBanner();
  }
Future<void> fetchBanner() async {
  try {
    var response = await http.get(Uri.parse(AppContent.BASE_URL+ AppContent.banner_image));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      BannerModel bannerModel = BannerModel.fromJson(jsonResponse);
      myBanner.value = bannerModel.data ?? [];

      print(myBanner);
    } else {
      print(response.reasonPhrase);
    }
  } catch (e) {
    print(e.toString());
  }
}




}