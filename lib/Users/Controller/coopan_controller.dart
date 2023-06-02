import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Model/coopan_model.dart';


class CoopanController extends GetxController {
  var coupanDataList = <CouponData>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCoopanData();
  }

  Future<void> fetchCoopanData() async {
    try {
      final response = await http.get(Uri.parse('https://scsy.in/foodbazar/api/fetch-coupon'));
      if (response.statusCode == 200) {
        final jsonMap = jsonDecode(response.body);
        final couponModel = CouponModel.fromJson(jsonMap);
        if (couponModel.success == true && couponModel.data != null) {
          coupanDataList.assignAll(couponModel.data!);
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
