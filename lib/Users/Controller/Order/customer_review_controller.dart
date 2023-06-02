import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../Data/Api/API_URLs.dart';
import '../../../Data/Model/customer_review_model.dart.dart';





class CustomerReviewController extends GetxController {
  List<Data> review_list = [];
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    review();
  }

 
  Future review() async {
    try {
      final res = await http.post(Uri.parse(AppContent.BASE_URL+ AppContent.CUSTOMER_REVIEW_URL),
          body: {
            "user_id":"44"
          });
     var temp = jsonDecode(res.body)['data'];
     
      //  print(temp.toString()+"hiiiii");

      if (res.statusCode == 200) {


        print(temp.length);
        for (int i = 0; i < temp.length; i++) {
          if (temp[i] != null) {
        
              Map<String, dynamic> map = temp[i];
              review_list.add(Data.fromJson(map),);
              print(review_list.toString());
          

          }
        }
      }
      return review_list;
    } catch (e) {
      print(e.toString());
    }
  }
}
