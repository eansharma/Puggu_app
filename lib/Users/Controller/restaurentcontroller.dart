import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/restaurent_model.dart';

class RestaurentController extends GetxController {
  var restaurentList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    restaurentData();
  }

  Future<void> restaurentData() async {
    try {
      var request =
          http.Request('GET', Uri.parse(AppContent.BASE_URL+ AppContent.RESTAURENT_URL));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        print(jsonResponse);
        var decodedResponse = jsonDecode(jsonResponse);
        RestaurentModel restaurentModel = RestaurentModel.fromJson(decodedResponse);
        if (restaurentModel.data != null) {
          restaurentList.assignAll(restaurentModel.data!);
        }
        print(restaurentList);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
    }
  }
}