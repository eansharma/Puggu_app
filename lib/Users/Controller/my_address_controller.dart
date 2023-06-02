import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:pugau/Users/Screens/my_address.dart';
import 'package:pugau/widget/customSnakebar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Data/Model/my_add_list_model.dart';


class MyAddressListController extends GetxController {
  var list = <Data>[].obs;
  RxBool isLogin = false.obs;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fechData();
  }
  Future add_address(String address,longitude,latitude,landmark,street_address,city_id
      ) async {
    isLoading = true;
    update();
    final pref = await SharedPreferences.getInstance();
    var userId = pref.getString('user_id');
    final response = await http.post(
        Uri.parse(AppContent.BASE_URL + AppContent.ADD_ADDRESS),
        body: {
          "user_id":userId,
          "address_type":"1",
          "address":address,
          "longitude":longitude,
          "latitude":latitude,
          "landmark":landmark,
          "street_address":street_address,
          "city_id":city_id,

        });
    var res = jsonDecode(response.body);
    print(res);
    if (res['success'] == true) {
      Get.to(()=>MyAddress(title: '',));
      fechData();
      showCustomSnackBar(res['message'].toString(), isError: false);
    } else {
      showCustomSnackBar(res['message'].toString(), isError: true);
    }
    isLoading = false;
    update();
  }

  Future fechData() async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    print(userid);

    if (userid == null){
      isLogin = false.obs;
    }else{
      isLogin = true.obs;
    }

    final response = await http
        .post(Uri.parse(AppContent.BASE_URL+ AppContent.MY_Address_LIST), body: {
      'user_id': userid,
    });

    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body)['data'];
      if (temp.isNotEmpty) {
        for (var i = 0; i < temp.length; i++) {
          if (temp[i] != null) {
            Map<String, dynamic> map = temp[i];
            list.add(Data.fromJson(map));
          }
        }
      }

      final jsonData = jsonDecode(response.body)['data'];
      list = jsonData.map((data) => Data.fromJson(data));
    }


    update();
    return list;
  }
}

