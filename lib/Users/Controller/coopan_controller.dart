import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/coopan_model.dart';

class CoopanController extends GetxController {
  var dataList = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }

  Future fetchData() async {
    try {
      final res =
          await http.get(Uri.parse(AppContent.BASE_URL + AppContent.COOPAN));
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              dataList.add(Data.fromJson(map));
            }
          }
        }
      }
      update();
      print(dataList);
      return dataList;
    } catch (e) {
      print(e.toString());
    }
  }
}
