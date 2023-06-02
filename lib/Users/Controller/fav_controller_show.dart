

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Data/Model/fev_restaurent_show.dart';


class FavRestaurantShowController extends GetxController {
  var list = <Data>[].obs;
  bool isLogin =true;

  @override
  void onInit() {
    super.onInit();
    print("************************");
    fechData();
    print("************************");
  }


  Future fechData() async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    print(userid);

    if (userid == null){
      isLogin = false;
    }else{
      isLogin = true;
    }




    final response = await http
        // .post(Uri.parse("https://scsy.in/foodbazar/api/fav-restrorent-show"), body: {
        .post(Uri.parse(AppContent.BASE_URL + AppContent.FAV_RESTAURANT_SHOW), body: {
      'customer_id': userid,
    });

    print(response.body);
    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body)['data'];
      list.clear();
      print('USERID FROM FAV $userid');
      print("TMPFavShow - ${temp.length}");
      if (temp.isNotEmpty) {
        for (var i = 0; i < temp.length; i++) {
            Map<String, dynamic> map = temp[i];
            list.add(Data.fromJson(map));
        }

      }
      print('LIST1 - $list');
      final jsonData = jsonDecode(response.body);
      list = jsonData.map((data) => FavRestaurantShow.fromJson(data)) as RxList<Data>;
    }

    print('LIST - $list');
    update();
    return list;
  }
}

