import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Model/view_card_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ViewCardController extends GetxController {
  var viewcardList = ViewCardModel();
  // var viewcardList = ViewCardModel().obs;

  var isLoading = true.obs;
  bool isLogin = false;

  @override
  void onInit() {
    super.onInit();
    viewCardData();
  }

  Future viewCardData() async {
    try {
      final pref = await SharedPreferences.getInstance();
      var userid = pref.getString('user_id');
      final response = await http.post(Uri.parse('https://scsy.in/foodbazar/api/cart'), body: {
        'user_id': '1020',
      });

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        viewcardList = ViewCardModel.fromJson(jsonResponse);
        update();
      }
      return viewcardList;
    } catch(e)
    {
      print(e);
    }



  }
}

