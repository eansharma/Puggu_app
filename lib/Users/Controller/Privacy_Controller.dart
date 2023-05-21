import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/aboutUs_model.dart';

class PrivacyController extends GetxController {
  var list = <Data>[].obs;
  @override
  void onInit() {
    super.onInit();
    // fechData();
  }

  Future<List<Data>> fechData(String check) async {
    final response = await http
        .post(Uri.parse(AppContent.BASE_URL + AppContent.WEB_PAGE), body: {
      'key': check,
    });
    if (response.statusCode == 200) {
      List<dynamic> temp = [];
      temp = jsonDecode(response.body)["data"];
      if (temp.isNotEmpty) {
        for (int i = 0; i < temp.length; i++) {
          if (temp[i] != null) {
            print(temp[i]);
          }
          Map<String, dynamic> map = temp[i];
          list.add(
            Data.fromJson(map),
          );
          update();
        }
      }
    }
    update();
    return list;
  }
}
