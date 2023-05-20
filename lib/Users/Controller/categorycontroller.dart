import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:http/http.dart' as http;

import '../../Data/Model/category_model.dart';

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
      final response =
          await http.get(Uri.parse(AppContent.BASE_URL + AppContent.CATEGORY_URL));

      if (response.statusCode == 200) {
         var temp = jsonDecode(response.body)['data'];
          if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              categoryList.add(Data.fromJson(map));
              print(categoryList);
            }
          }
        }
      }
      update();
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}