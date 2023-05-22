import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../Data/Model/customer_review_model.dart.dart';



class CustomerReviewController extends GetxController {
  var reviewList = <Data>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    reviewData();
  }

  Future<void> reviewData() async {
    try {
      final pref = await SharedPreferences.getInstance();
      var userId = pref.getString('user_id');
      final url = 'https://scsy.in/foodbazar/api/customer-review';
      final body = {
        'user_id': userId,
      };

      isLoading(true);
      final response = await http.post(Uri.parse(url), body: body);
      
      print('data fetch');
      print(response);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        final customerReviewModel = CustomerReviewModel.fromJson(jsonData);
        if (customerReviewModel.data != null) {
          reviewList.assignAll(customerReviewModel.data!);
        print('data is recive');
          print(reviewList);
        
        }
        isLoading(false);
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
