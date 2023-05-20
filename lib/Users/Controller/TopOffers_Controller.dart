import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pugau/Data/Api/API_URLs.dart';


import '../../Data/Model/TopOffres_model.dart';

class TopOfferController extends GetxController {
  var topOfferData = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  Future fetchData() async {
    try {
      final res = await http
          .get(Uri.parse(AppContent.BASE_URL + AppContent.TOP_OFFERS));
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              topOfferData.add(Data.fromJson(map));
            }
          }
        }
      }
      update();
      return topOfferData;
    } catch (e) {
      print(e.toString());
    }
  }
}
