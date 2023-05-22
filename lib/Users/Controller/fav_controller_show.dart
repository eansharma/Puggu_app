import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';



import '../../Data/Model/fev_restaurent_show.dart';


class FavRestaurantShowController extends GetxController {
  var list = <Data>[].obs;


  Future fechData() async {

    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');


    final response = await http
        .post(Uri.parse("https://scsy.in/foodbazar/api/fav-restrorent-show"), body: {
      'customer_id': userid,
    });

    print(response.body);
    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body)['data'];
      print("TMPFavShow - ${temp.length}");
      if (temp.isNotEmpty) {
        for (var i = 0; i < temp.length; i++) {
          if (temp[i] != null) {
            Map<String, dynamic> map = temp[i];
            list.add(Data.fromJson(map));
          }
        }

        print("list - ${list}");
        print("____________________");
      }

      final jsonData = jsonDecode(response.body) as List<dynamic>;
      list = jsonData.map((data) => FavRestaurantShow.fromJson(data)) as RxList<Data>;
    }


    update();
    return list;
  }
}

