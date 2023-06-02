import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Model/Restaurent_Product_model.dart';

class Resaurent_Product_Controller extends GetxController {
  List<Data> Restaurent= [];
  String? filter="";
  @override
  void onInit() {
    super.onInit();
    product("","All");
  }
  Future product(String seller_id,type )async {
    try {
      final res = await http
          .post(Uri.parse(AppContent.BASE_URL +AppContent.RESTAURENT_PRODUCT_URL),body: {
            "seller_id":seller_id,
            "type":type,
      });
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        update();
        if (temp.isNotEmpty) {
           Restaurent.clear(); 
          for (var i = 0; i < temp.length; i++) {
            update();
            if (temp[i].isNotEmpty) {
              Map<String, dynamic> map = temp[i];
              Restaurent.add(Data.fromJson(map));
              update();
            }
          }
        }
      }
      update();
      return Restaurent;
    } catch (e) {
      print(e.toString());
    }
  }


  void check(String? type)
  {
    filter=type;
    update();
  }
}
