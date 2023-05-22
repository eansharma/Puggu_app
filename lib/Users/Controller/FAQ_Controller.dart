import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/Faq_model.dart';

class FaqController extends GetxController {
  var faqData = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchFaqData();
  }

  Future fetchFaqData() async {
    try {
      final res =
          await http.get(Uri.parse(AppContent.BASE_URL + AppContent.FAQ));
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              faqData.add(Data.fromJson(map));
            }
          }
        }
      }
      update();
      print(faqData);
      return faqData;
    } catch (e) {
      print(e.toString());
    }
  }
}
