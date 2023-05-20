import 'dart:convert';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../Data/Model/sub_category_model.dart';

class SubCategoryController extends GetxController {
  var subList = <Data>[].obs;
  var isloading = true.obs;

  @override
  void onReady() {
    super.onReady();
    subDataFetch();
  }

  Future<void> subDataFetch() async {
    try {
      isloading(true);
      final response = await http.get(Uri.parse('https://scsy.in/foodbazar/api/submenu/40'));

      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body)['data'];
        // print(temp);
        if (temp.isNotEmpty) {
          subList.clear(); // Clear existing list before adding new items
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              subList.add(Data.fromJson(map));
              print(subList.length);
            }
          }
        }
      }
      update();
    } catch (e) {
      print(e);
    } finally {
      isloading(false);
    }
  }
}
