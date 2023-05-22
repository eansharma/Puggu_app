import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pugau/Data/Api/API_URLs.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Model/restaurent_model.dart';

class ReataurentController extends GetxController {
  var restaurentList = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRestaurentData();
  }

  Future fetchRestaurentData() async {
    final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');
    try {
      final res = await http.post(
          Uri.parse(AppContent.BASE_URL + AppContent.RESTAURENT_URL),
          body: {
            'customer_id': userId,
          });
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];

        print("Hello......${temp.length}");

        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              restaurentList.add(Data.fromJson(map));
            }
          }
        }

        update();
      }

      print("Data is received");
      print("${restaurentList.length} Aditya");
      return restaurentList;
    } catch (e) {
      print(e.toString());
    }
  }
}
