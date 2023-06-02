import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pugau/Data/Api/API_URLs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Data/Model/notification_model.dart';

class NotificationController extends GetxController {
  var notifiList = <Data>[].obs;


  @override
  void onInit() {
// TODO: implement onInit
    super.onInit();
    fetchNotifiData();
  }

  Future fetchNotifiData() async {
    final pref = await SharedPreferences.getInstance();
    var userid = pref.getString('user_id');
    print("USER ID FROM fav_restrorent_controller-  $userid");

    try {
      final response = await http.post(
          Uri.parse('https://scsy.in/foodbazar/api/notification'),
          body: {

            // 'user_id': userid,
            'user_id': '737'
          });

      if (response.statusCode == 200) {
        var temp = jsonDecode(response.body)['data'];
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i] != null) {
              Map<String, dynamic> map = temp[i];
              notifiList.add(Data.fromJson(map));
            }
          }
        }
      }
      update();

      return notifiList;
    } catch (e) {
      print(e.toString());
    }
  }
}
