import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:http/http.dart' as http;

import '../../Data/Model/catagory_model.dart';

class CategoryController extends GetxController {
  var categoryList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    categoryData();
  }

  Future<void> categoryData() async {
    try {
      isLoading(true);
      var request = http.Request(
          'GET', Uri.parse(AppContent.BASE_URL + AppContent.CATEGORY_URL));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = await response.stream.bytesToString();
        var decodedResponse = jsonDecode(jsonResponse);
        CatagoryModel categoryModel = CatagoryModel.fromJson(decodedResponse);
        categoryList.assignAll(categoryModel.data!);

        print(categoryList);
      }
      update();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
