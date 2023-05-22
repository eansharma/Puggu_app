import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Model/restaurent_model.dart';


class RestaurentController extends GetxController {
  var restaurentList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    restaurentData();
  }

  Future restaurentData() async {

    try {

        final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');
      final res = await http.post(Uri.parse(AppContent.BASE_URL+AppContent.RESTAURENT_URL),
      body: {
        "customer_id":userId
      });
      if (res.statusCode == 200) {
        List<dynamic> temp = [];
        temp = jsonDecode(res.body)['data'];
        for (int i = 0; i < temp.length; i++) {
          if (temp[i] != null) {
            Map<String, dynamic> map = temp[i];
            restaurentList.add(Data.fromJson(map),);
          }
        }
      }
      update();
      return restaurentList;
    } catch (e) {
      print(e.toString());
    }


   /* try {
      var request =
          http.Request('GET', Uri.parse(AppContent.BASE_URL+ AppContent.RESTAURENT_URL));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        print(jsonResponse);
        var decodedResponse = jsonDecode(jsonResponse);
        Data restaurentModel = Data.fromJson(decodedResponse);
        if (restaurentModel.data != null) {
          restaurentList.assignAll(restaurentModel.data!);
        }
        print(restaurentList);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }*/
  }
}