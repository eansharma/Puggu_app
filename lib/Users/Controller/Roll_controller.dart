import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:pugau/Data/Api/API_URLs.dart';

import '../../Data/Model/Roll_model.dart';


class RoleController extends GetxController {
  var roleData = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchRoleData();
  }

  Future fetchRoleData() async {
    update();
    try {
      final res =
          await http.get(Uri.parse(AppContent.BASE_URL + AppContent.ROLE));
      update();
      if (res.statusCode == 200) {
        var temp = jsonDecode(res.body)['data'];
        print(temp);
        if (temp.isNotEmpty) {
          for (var i = 0; i < temp.length; i++) {
            if (temp[i].isNotEmpty) {
              Map<String, dynamic> map = temp[i];
              roleData.add(Data.fromJson(map));
            }
          }
        }
      }
      update();
      print(roleData);
      return roleData;
    } catch (e) {
      print(e.toString());
    }
  }
}
